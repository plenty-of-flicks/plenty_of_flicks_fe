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

  def swipe
    swipe = BackendService.create_swipe(swipe_params.merge(user_id: current_user.id))

    if params[:random] = true
      redirect_to discover_random_path
    else
      # future iteration
    end
  end

  private

  def swipe_params
    params.permit(:rating, :movie_id)
  end
end
