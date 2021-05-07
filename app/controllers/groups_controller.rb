class GroupsController < ApplicationController
  before_action :authenticate

  def index
    @groups = GroupFacade.top_three_groups(current_user.id)
  end

  def show
    @group = GroupFacade.find_group(params[:id])
  end

  def all
    @groups = GroupFacade.all_groups(current_user.id)
  end

  def new
    @friends = UserFacade.all_friends(current_user.id)
  end

  def create
    user_ids = user_ids(params)
    group = GroupFacade.make_group(user_ids, group_params[:name])

    redirect_to "/groups/#{group.id}", notice: "#{group.name} was successfully created."
  end

  private

  def user_ids(params)
    friends = params.select do |key, value|
      value == "1"
    end
    ids = friends.keys.map do |id|
      id.to_i
    end
    ids << current_user.id
  end

  def group_params
    params.permit(:name)
  end
end
