class Friend
  attr_reader :id,
              :first_name,
              :last_name,
              :email,
              :image,
              :uid
              
  def initialize(friend_data)
    @id = friend_data[:id]
    @first_name = friend_data[:first_name]
    @last_name = friend_data[:last_name]
    @email = friend_data[:email]
    @image = friend_data[:image]
    @uid = friend_data[:uid]
  end
end
