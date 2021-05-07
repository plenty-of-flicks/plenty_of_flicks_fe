class GroupsController < ApplicationController
  before_action :authenticate

  def index
    @groups = UserFacade.top_three_groups(current_user.id)
    # @friends = UserFacade.all_friends(current_user.id)
  end

  def all
    @groups = UserFacade.all_groups(current_user.id)
  end
end
