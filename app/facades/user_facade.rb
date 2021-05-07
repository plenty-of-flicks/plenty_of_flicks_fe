class UserFacade
  def self.find_or_create_user(user_params)
    user_data = BackendService.find_or_create_be_user(user_params)
    User.new(user_data)
  end

  def self.update_existing_user(user_params, uid)
    user_data = BackendService.update_user(user_params, uid)
    User.new(user_data)
  end

  def self.add_friend(user_id, friend_email)
    friend_data = BackendService.create_friendship(user_id, friend_email)
    if friend_data[:error]
      friend_data[:error]
    else
      User.new(friend_data)
    end
  end

  def self.top_three_friends(user_id)
    friends_data = BackendService.get_friendslist(user_id)
    friends_data[:data][:attributes][:friends].sample(3).map do |friend_data|
      Friend.new(friend_data)
    end
  end

  def self.all_friends(user_id)
    friends_data = BackendService.get_friendslist(user_id)
    friends_data[:data][:attributes][:friends].map do |friend_data|
      Friend.new(friend_data)
    end
  end

  def self.top_three_groups(user_id)
    groups_data = BackendService.get_group_list(user_id)
    groups = groups_data.sample(3).map do |group_data|
      group_members = group_data[:data][:attributes][:users].map do |user_data|
        GroupMember.new(user_data)
      end
      Group.new(group_data, group_members)
    end
  end
end
