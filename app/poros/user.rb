class User
  attr_reader :id,
              :first_name,
              :last_name,
              :email,
              :uid,
              :image

  def initialize(user_data)
    @id = user_data[:data][:id].to_i
    @first_name = user_data[:data][:attributes][:first_name]
    @last_name = user_data[:data][:attributes][:last_name]
    @email = user_data[:data][:attributes][:email]
    @uid = user_data[:data][:attributes][:uid]
    @image = user_data[:data][:attributes][:image]
  end
end
