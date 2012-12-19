task :testemail => :environment do
  tickets_changed = Array.new()
  tickets_changed.push(Ticket.first)
  tickets_changed.push(Ticket.last)
  params = {"email" => 'veeraya.pupat@gmail.com', "tickets" => tickets_changed}
  UserMailer.notification_email(params).deliver
  puts "sending email with params #{params}"
end
