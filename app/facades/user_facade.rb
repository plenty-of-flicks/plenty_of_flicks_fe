class UserFacade
  def self.find_or_create_user(user_params)
    user_data = UserService.find_or_create_be_user(user_params)
    User.new(user_data)
  end

  def self.find_existing_user(uid)
    user_data = UserService.find_user_data(uid)
    User.new(user_data)
  end
end
