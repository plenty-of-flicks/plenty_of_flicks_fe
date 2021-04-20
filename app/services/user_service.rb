class UserService
  def self.find_or_create_be_user(user_params)
    response = conn.post('/api/v1/users') do |req|
      user_params.each do |key, value|
        req.params[key] = value
      end
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_user(uid)
    response = conn.get("/api/v1/users/#{uid}")

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: ENV['POF_BE'])
  end
end
