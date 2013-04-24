task :scrape => :environment do
    require 'nokogiri'
    require 'open-uri'
    require 'json'

    doc = Nokogiri::HTML(open("http://www.ellentv.com/tickets"))
    scripts = doc.css("#content-main script").to_s
    events_data = scripts.match(/var events(.)+(\];)/m).to_s
    #just the inside [ ]
    events_data = events_data.match(/\[(.)+\]/m).to_s
    events_data = JSON.parse(events_data)

    # attributes are as followed
    # EventID
    # StartDateTime
    # EndDateTime
    # Title
    # URL
    # CssClass
    # the CssClass we want is "coming-soon" or "tickets-available"

    tickets_changed = Array.new()
    events_data.each do |event|
      ticket = Ticket.find_by_date("#{event['StartDateTime']}")
      ticket = Ticket.find_by_date("#{event['StartDateTime']} 00:00:00") if ticket.nil?

      if ticket.nil? #new entry
        ticket = Ticket.create(date: "#{event['StartDateTime']}", status: "#{event['CssClass']}")
        tickets_changed.push(ticket)
      elsif ticket.status != event['CssClass']
          ticket.status = event['CssClass']
          ticket.save()
          tickets_changed.push(ticket)
      end
    end

    if tickets_changed.count > 0

      # find users whose (explicitly defined) tracked ticket dates are the same as the date of the ticket with status change
      date_constraint = ""
      tickets_changed.each do |tic|
        date_constraint << " OR t.date = '" << tic.date.to_s << "'"
      end
      date_constraint.slice!(0..2)
      query = "SELECT DISTINCT u.email FROM trackings t, users u, trackings_users tu WHERE t.id = tu.tracking_id AND u.id = tu.user_id "
      query << " AND ( #{date_constraint} )"
      emails = ActiveRecord::Base.connection.execute(query)

      if emails.count > 0
        emails.each do |e|
          params = {"email" => e["email"], "tickets" => tickets_changed}
          UserMailer.notification_email(params).deliver
          puts "Sent email to #{e["email"]} - user with track_all = false"
        end
      end

      # email users who choose to track all ticket dates
      User.where(:track_all => true).each do |user|
        params = {"email" => user["email"], "tickets" => tickets_changed}
        UserMailer.notification_email(params).deliver
        puts "Sent email to #{user["email"]} - user with track_all = true"
      end
    end

    # log message
    puts "there are #{tickets_changed.count} tickets with changes"
    tickets_changed.each do |ticket|
      puts "Date #{ticket.date} Status: #{ticket.status}"
    end
end
