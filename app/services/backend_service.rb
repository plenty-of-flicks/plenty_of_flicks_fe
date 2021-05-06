class BackendService
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

  def self.find_random_movie_info(user_id)
    response = conn.get('/api/v1/movies/random_available') do |req|
      req.params[:user_id] = user_id
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_or_create_be_user(user_params)
    response = conn.post('/api/v1/users') do |req|
      user_params.each do |key, value|
        req.params[key] = value
      end
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_user(user_params, uid)
    response = conn.patch("/api/v1/users/#{uid}") do |req|
      user_params.each do |key, value|
        req.params[key] = value
      end
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_swipe(swipe_params)
    response = conn.post("/api/v1/swipes") do |req|
      swipe_params.each do |key, value|
        req.params[key] = value
      end
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_friendship(user_id, friend_email)
    response = conn.post("/api/v1/users/#{user_id}/friendships") do |req|
      req.params[:friend_email] = friend_email
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_friendslist(user_id)
    response = conn.get("/api/v1/users/#{user_id}/friends")

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: ENV['POF_BE'])
  end
end
