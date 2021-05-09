class MovieFacade
  def self.find_movie(id)
    movie_details = BackendService.get_movie_details(id)
    movie = Movie.new(movie_details)
  end
end
