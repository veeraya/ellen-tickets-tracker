class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_admin
    redirect_to root_url unless admin_signed_in?
  end
end
