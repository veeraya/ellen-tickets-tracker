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

# attributes are as followed
# EventID
# StartDateTime
# EndDateTime
# Title
# URL
# CssClass
# the CssClass we want is "coming-soon" or "tickets-available"

# now we can do things like 
events_data.each do |event| 
  if event["CssClass"] == "tickets-available" 
    puts event["StartDateTime"] + " tickets available!!"
  elsif event["CssClass"] == "coming-soon"
    puts event["StartDateTime"] + " coming soon"
    
  end
end

