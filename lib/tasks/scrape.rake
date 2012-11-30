task :scrape => :environment do
    require 'nokogiri'
    require 'open-uri'
    require 'json'

    doc = Nokogiri::HTML(open("http://www.ellentv.com/tickets"))
    scripts = doc.css("#content-main script").to_s;
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
      UserMailer.notification_email(tickets_changed).deliver
    end

    # log message
    puts "there are #{tickets_changed.count} tickets with changes"
    tickets_changed.each do |ticket|
      puts "Date #{ticket.date} Status: #{ticket.status}"
    end
end
