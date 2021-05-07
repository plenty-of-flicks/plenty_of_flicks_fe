class Group
  attr_reader :id,
              :name,
              :users

  def initialize(group_data, users)
    @id = group_data[:data][:attributes][:id]
    @name = group_data[:data][:attributes][:name]
    @users = users
  end
end
