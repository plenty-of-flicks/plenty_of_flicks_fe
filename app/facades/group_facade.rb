class GroupFacade
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
end
