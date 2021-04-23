class SwipesController < ApplicationController
  def create
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
