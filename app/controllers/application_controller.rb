class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def authenticate
    unless user_signed_in?
      redirect_to root_path, notice: "You must be logged in to perform that action. Click 'Log In' to log in or create an account."
    end
  end

  def current_user
    @current_user ||= CurrentUser.new(session[:current_user]) if session[:current_user]
  end

  def user_signed_in?
    !!current_user
  end
end
