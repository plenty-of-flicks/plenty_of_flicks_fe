class GroupMember
  attr_reader :id,
              :email,
              :first_name,
              :last_name,
              :image,
              :uid

  def initialize(user_data)
    @id = user_data[:id]
    @email = user_data[:email]
    @first_name = user_data[:first_name]
    @last_name = user_data[:last_name]
    @image = user_data[:image]
    @uid = user_data[:uid]
  end
end
