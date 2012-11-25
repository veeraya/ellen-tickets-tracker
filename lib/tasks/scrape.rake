task :scrape => :environment do
    require 'nokogiri'
    require 'open-uri'
    require 'json'

    doc = Nokogiri::HTML(open("http://www.ellentv.com/tickets"))
    scripts = doc.css("#content-main script").to_s;
    events_data = scripts.match(/var events(.)+(\];)/m).to_s
    #just the inside [ ]
    events_data = events_data.match(/\[(.)+\]/m).to_s
    #parse!
    events_data = JSON.parse(events_data)
    puts "Events are #{events_data}"

    # attributes are as followed
    # EventID
    # StartDateTime
    # EndDateTime
    # Title
    # URL
    # CssClass
    # the CssClass we want is "coming-soon" or "tickets-available"

    tapings_with_changes = Array.new()
    events_data.each do |event| 
      taping = Taping.find_by_taping_date("#{event['StartDateTime']}")
      puts "searc1 #{taping}"
      taping = Taping.find_by_taping_date("#{event['StartDateTime']} 00:00:00") if taping.nil?
      puts "serach2 #{taping}"
      if taping.nil? #new entry
        taping = Taping.create(taping_date: "#{event['StartDateTime']}", ticket_status: "#{event['CssClass']}")
        tapings_with_changes.push(taping)
      elsif taping.ticket_status != event['CssClass']
          taping.ticket_status = event['CssClass']
          taping.save()
          tapings_with_changes.push(taping)
      end
    end

    puts "there are #{tapings_with_changes.count} tapings with changes"
end
