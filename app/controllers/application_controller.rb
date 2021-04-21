class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def authenticate
    # add flash message here
    redirect_to google_login_path unless user_signed_in?
  end

  def current_user
    @current_user ||= UserFacade.find_existing_user(session[:uid]) if session[:uid]
  end

  def user_signed_in?
    !!current_user
  end
end
