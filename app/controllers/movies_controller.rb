class MoviesController < ApplicationController
  before_action :authenticate

  def show
    @movie = MovieFacade.find_movie(params[:id])
  end
end
