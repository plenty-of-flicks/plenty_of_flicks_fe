class AdminController < ApplicationController
  def index

  end

  def refresh_availability
    # call be refresh
    # create flash message

    output = RefreshFacade.refresh_availability(params[:service])
    service_name = output[:data][:attributes][:name]
    movie_count = output[:data][:attributes][:movie_count]
    redirect_to admin_index_path, notice: "#{service_name} has been updated and currently has #{movie_count} movies available."
  end
end
