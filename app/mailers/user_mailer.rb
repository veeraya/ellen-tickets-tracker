class UserMailer < ActionMailer::Base
  default from: "veeraya.pupat@gmail.com"

  def notification_email(params)
    @tickets = params['tickets']
    mail(:to => params['email'], :subject => "Ellen ticket show status change!")
  end
end
