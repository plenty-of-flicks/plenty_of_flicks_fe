require 'rails_helper'

describe 'groups index page' do
  it 'shows top three groups', :vcr do
    stub_omniauth
    json_response = JSON.parse(File.read('spec/fixtures/groups/index/groups.json'), symbolize_names:true)
    group_list_path = ENV['POF_BE'] + '/api/v1/users/1/groups'
    stub_request(:get, group_list_path).to_return(status: 200, body: json_response)

    visit google_login_path

    visit groups_path

    within '.groupslist' do
      expect(page).to have_content('Scrantonicity')
      expect(page).to have_content('X Men')
      expect(page).to have_content('Fantastic Four')
      expect(page).to have_content('Nick King')
      expect(page).to have_content('Ron Swanson')
    end
  end

  it 'displays message when user has no groups', :vcr do
    stub_omniauth
    json_response = JSON.parse(File.read('spec/fixtures/groups/index/groups_no_groups.json'), symbolize_names:true)
    groups_list_path = ENV['POF_BE'] + '/api/v1/users/1/groups'
    stub_request(:get, groups_list_path).to_return(status: 200, body: json_response)

    visit google_login_path

    visit groups_path

    expect(page).to have_content('You currently have no groups :(')
  end

  it 'view all groups link shows all groups of user', :vcr do
    stub_omniauth
    json_response = JSON.parse(File.read('spec/fixtures/groups/index/groups_four_groups.json'), symbolize_names:true)
    group_list_path = ENV['POF_BE'] + '/api/v1/users/1/groups'
    stub_request(:get, group_list_path).to_return(status: 200, body: json_response)

    visit google_login_path

    visit groups_path

    click_link 'View All Groups'

    within '.groupslist' do
      expect(page).to have_content('Scrantonicity')
      expect(page).to have_content('X Men')
      expect(page).to have_content('Fantastic Four')
      expect(page).to have_content('The Avengers')
      expect(page).to have_content('Nick King')
      expect(page).to have_content('Ron Swanson')
    end
  end

  it 'create group button redirects to group new page', :vcr do
    stub_omniauth
    groups_json_response = JSON.parse(File.read('spec/fixtures/groups/index/groups_no_groups.json'), symbolize_names:true)
    groups_list_path = ENV['POF_BE'] + '/api/v1/users/1/groups'
    stub_request(:get, groups_list_path).to_return(status: 200, body: groups_json_response)

    friends_json_response = JSON.parse(File.read('spec/fixtures/friends/index/friendslist_four_friends.json'), symbolize_names:true)
    friendslist_path = ENV['POF_BE'] + '/api/v1/users/1/friends'
    stub_request(:get, friendslist_path).to_return(status: 200, body: friends_json_response)


    visit google_login_path

    visit groups_path

    click_link 'Create a New Group'

    expect(current_path).to eq(new_group_path)
    expect(page).to have_content('Ron Swanson')
    expect(page).to have_content('Tammy Swanson')
    expect(page).to have_content('Leslie Knope')
    expect(page).to have_content('Tom Haverford')
  end

  it 'group name links route to group show page', :vcr do
    stub_omniauth

    json_response = JSON.parse(File.read('spec/fixtures/groups/index/groups.json'), symbolize_names:true)
    group_list_path = ENV['POF_BE'] + '/api/v1/users/1/groups'
    stub_request(:get, group_list_path).to_return(status: 200, body: json_response)

    x_men_response = JSON.parse(File.read('spec/fixtures/groups/show/x_men.json'), symbolize_names:true)
    x_men_show_path = ENV['POF_BE'] + '/api/v1/groups/159'
    stub_request(:get, x_men_show_path).to_return(status: 200, body: x_men_response)

    visit google_login_path

    visit groups_path

    click_link ('X Men')

    expect(current_path).to eq(group_path(159))
    expect(page).to have_content('X Men')
    expect(page).to have_content('Nick King')
    expect(page).to have_content('nickmaxking@gmail.com')
    expect(page).to have_content('Ron Swanson')
    expect(page).to have_content('ron@example.com')
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '12345678910',
      info: {
        'name' => 'Nick King',
        'email' => 'nickmaxking@gmail.com',
        'email_verified' => true,
        'first_name' => 'Nick',
        'last_name' => 'King',
        'image' => 'https://lh6.googleusercontent.com/-hEH5aK9fmMI/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucntLnugtaOVsqmvJGm89fFbDJ6GaQ/s96-c/photo.jpg'
        },
      credentials: {
        token: 'abcdefg12345',
        expires_at: DateTime.now,
        expires: true
      }
    })
  end
end
