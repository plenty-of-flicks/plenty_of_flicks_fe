class DiscoverService
  def self.find_random_movie_info(user_id)
    response = conn.get('/api/v1/movies/random_available') do |req|
      req.params[:user_id] = user_id
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: ENV['POF_BE'])
  end
end
