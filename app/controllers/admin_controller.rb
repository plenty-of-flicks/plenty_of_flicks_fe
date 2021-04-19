class AdminController < ApplicationController
  def index

  end

  def refresh_availability
    refresh = AdminFacade.refresh_service_availability(params[:service])

    redirect_to admin_index_path, notice: "#{refresh.service_name} has been updated and currently has #{refresh.movie_count} movies available."
  end

  def update_movie_details
    response = AdminFacade.update_movie_details
    output = "#{response[:movies_updated]} movies updated. Update status: #{response[:update_status]}"
    
    redirect_to admin_index_path, notice: output
  end
end
