class SessionsController < ApplicationController
  def create
    @current_user = UserFacade.find_or_create_user(user_params)
    session[:uid] = @current_user.uid

    redirect_to root_path, notice: "Welcome, #{@current_user.first_name}!"
  end

  def destroy
    session.clear

    redirect_to root_path, notice: 'You are now logged out.'
  end

  protected

  def user_params
    auth_hash = request.env['omniauth.auth']
    {
      uid: auth_hash[:uid],
      email: auth_hash[:info][:email],
      first_name: auth_hash[:info][:first_name],
      last_name: auth_hash[:info][:last_name],
      image: auth_hash[:info][:image]
    }
  end
end
