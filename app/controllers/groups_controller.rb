class GroupsController < ApplicationController
  before_action :authenticate

  def index
    @groups = UserFacade.top_three_groups(current_user.id)
  end
end
