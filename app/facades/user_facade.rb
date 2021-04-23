class UserFacade
  def self.find_or_create_user(user_params)
    user_data = BackendService.find_or_create_be_user(user_params)
    User.new(user_data)
  end
  
  def self.update_existing_user(user_params, uid)
    user_data = BackendService.update_user(user_params, uid)
    User.new(user_data)
  end
end
