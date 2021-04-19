class Refresh
  attr_reader :service_name,
              :movie_count

  def initialize(availability_data)
    @service_name = availability_data[:data][:attributes][:name]
    @movie_count = availability_data[:data][:attributes][:movie_count]
  end
end
