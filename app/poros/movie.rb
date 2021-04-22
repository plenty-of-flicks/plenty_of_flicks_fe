class Movie
  attr_reader :id,
              :title,
              :tmdb_id,
              :poster_path,
              :description,
              :genres,
              :vote_average,
              :vote_count,
              :year
              
  def initialize(movie_info)
    @id = movie_info[:data][:id].to_i
    @title = movie_info[:data][:attributes][:title]
    @tmdb_id = movie_info[:data][:attributes][:tmdb_id]
    @poster_path = movie_info[:data][:attributes][:poster_path]
    @description = movie_info[:data][:attributes][:description]
    @genres = organize_genres(movie_info[:data][:attributes][:genres])
    @vote_average = movie_info[:data][:attributes][:vote_average]
    @vote_count = movie_info[:data][:attributes][:vote_count]
    @year = movie_info[:data][:attributes][:year]
  end

  def organize_genres(genres_info)
    genres = genres_info.map do |genre_info|
      genre_info[:name]
    end
  end
end
