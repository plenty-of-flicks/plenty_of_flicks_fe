class AdminService
  def self.refresh_availability(service)
    response = conn.get('/api/v1/services/update_availability') do |req|
      req.params[:service] = service
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_details
    response = conn.get('/api/v1/movies/populate_details')

    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

    def self.conn
      Faraday.new(url: ENV['POF_BE'])
    end
end
