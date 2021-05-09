class Match
  attr_reader :id,
              :title,
              :tmdb_id,
              :poster_path,
              :description,
              :genres,
              :vote_average,
              :vote_count,
              :year,
              :services

  def initialize(match_info)
    @id = match_info[:id].to_i
    @title = match_info[:attributes][:title]
    @tmdb_id = match_info[:attributes][:tmdb_id]
    @poster_path = match_info[:attributes][:poster_path]
    @description = match_info[:attributes][:description]
    @genres = organize_genres(match_info[:attributes][:genres])
    @vote_average = match_info[:attributes][:vote_average]
    @vote_count = match_info[:attributes][:vote_count]
    @year = match_info[:attributes][:year]
    @services = organize_services(match_info[:attributes][:services])
  end

  def organize_genres(genres_info)
    genres_info.map do |genre_info|
      genre_info[:name]
    end
  end

  def organize_services(services_info)
    services_info.map do |service_info|
      Service.new(service_info)
    end
  end
end
