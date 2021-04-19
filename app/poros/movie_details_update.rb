class MovieDetailsUpdate
  attr_reader :movie_count,
              :status
              
  def initialize(data)
    @movie_count = data[:movies_updated]
    @status = data[:update_status]
  end
end
