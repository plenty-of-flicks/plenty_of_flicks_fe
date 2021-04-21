class CurrentUser
  attr_reader :id,
              :first_name,
              :last_name,
              :email,
              :uid,
              :image

  def initialize(user_data)
    @id = user_data['id']
    @first_name = user_data['first_name']
    @last_name = user_data['last_name']
    @email = user_data['email']
    @uid = user_data['uid']
    @image = user_data['image']
  end
end
