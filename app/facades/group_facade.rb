class GroupFacade
  def self.top_three_groups(user_id)
    groups_data = BackendService.get_group_list(user_id)
    groups = groups_data.sample(3).map do |group_data|
      group_members = group_data[:data][:attributes][:users].map do |user_data|
        GroupMember.new(user_data)
      end
      Group.new(group_data, group_members)
    end
  end

  def self.all_groups(user_id)
    groups_data = BackendService.get_group_list(user_id)
    groups = groups_data.map do |group_data|
      group_members = group_data[:data][:attributes][:users].map do |user_data|
        GroupMember.new(user_data)
      end
      Group.new(group_data, group_members)
    end
  end

  def self.make_group(user_ids, name)
    group_info = BackendService.create_group(name)
    group = Group.new(group_info, [])
    user_ids.each do |user_id|
      user_group_info = BackendService.create_user_group(user_id, group.id)
    end
    group
  end

  def self.find_group(id)
    group_data = BackendService.get_group_details(id)
    group_members = group_data[:data][:attributes][:users].map do |user_data|
      GroupMember.new(user_data)
    end
    group = Group.new(group_data, group_members)
  end

  def self.find_matches(id)
    matches_data = BackendService.get_match_details(id)
    matches_data[:data].map do |match_data|
      Match.new(match_data)
    end
  end
end
