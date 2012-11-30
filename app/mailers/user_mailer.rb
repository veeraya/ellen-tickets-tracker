class UserMailer < ActionMailer::Base
  default from: "veeraya.pupat@gmail.com"

  def notification_email(tickets_changed)
    @tickets = tickets_changed
    mail(:to => "veeraya.pupat@gmail.com", :subject => "Ellen ticket show status change!")
  end
end
