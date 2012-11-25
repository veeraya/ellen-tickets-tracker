class UserMailer < ActionMailer::Base
  default from: "veeraya.pupat@gmail.com"

  def notification_email(tapings)
    @tapings = tapings
    mail(:to => "veeraya.pupat@gmail.com", :subject => "Ellen ticket show status change!")
  end
end
