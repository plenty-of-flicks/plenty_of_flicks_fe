class DiscoverController < ApplicationController
  before_action :authenticate

  def index

  end

  def show

  end

  def random
    @movie = DiscoverFacade.find_random_movie(current_user.id)
    @filter = {random: true}

    render :show
  end
end
