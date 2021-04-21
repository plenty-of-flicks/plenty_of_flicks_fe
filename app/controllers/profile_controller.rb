class ProfileController < ApplicationController
  before_action :authenticate

  def show

  end

  def edit

  end

  def update
    @current_user = UserFacade.update_existing_user(user_params, session[:uid])

    redirect_to profile_path, notice: 'Your profile information has been updated.'
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :image)
  end
end
