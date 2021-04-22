class DiscoverFacade
  def self.find_random_movie(user_id)
    movie_info = DiscoverService.find_random_movie_info(user_id)
    movie = Movie.new(movie_info)
  end
end
