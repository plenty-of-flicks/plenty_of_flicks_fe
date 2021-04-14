class AdminController < ApplicationController
  def index

  end

  def refresh_availability
    refresh = RefreshFacade.refresh_availability(params[:service])
    
    redirect_to admin_index_path, notice: "#{refresh.service_name} has been updated and currently has #{refresh.movie_count} movies available."
  end
end
