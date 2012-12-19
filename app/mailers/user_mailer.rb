class UserMailer < ActionMailer::Base
  default from: "veeraya.pupat@gmail.com"

  def notification_email(params)
    @tickets = params['tickets']
    @email = params['email'].gsub(/@/, '[at]')
    mail(:to => params['email'], :subject => "The Ellen DeGeneres Show Tickets Update")
  end
end
