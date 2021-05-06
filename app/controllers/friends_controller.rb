class FriendsController < ApplicationController
  before_action :authenticate

  def index
    @friends = UserFacade.top_three_friends(current_user.id)
  end

  def create
    friend = UserFacade.add_friend(current_user.id, params[:email])

    if friend.is_a?(String)
      redirect_to friends_path, notice: friend
    else
      redirect_to friends_path, notice: "#{friend.first_name} #{friend.last_name} has been added to friends list."
    end
  end

  def all
    @friends = UserFacade.all_friends(current_user.id)
  end
end
