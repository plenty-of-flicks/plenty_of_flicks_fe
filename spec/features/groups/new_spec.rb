require 'rails_helper'

describe 'groups new page' do
  it 'successful new group form returns descriptive flash message', :vcr do
    stub_omniauth
    friends_json_response = JSON.parse(File.read('spec/fixtures/friends/index/friendslist_four_friends.json'), symbolize_names:true)
    friendslist_path = ENV['POF_BE'] + '/api/v1/users/1/friends'
    stub_request(:get, friendslist_path).to_return(status: 200, body: friends_json_response)

    group_create_json_response = JSON.parse(File.read('spec/fixtures/groups/new/group_create_success.json'), symbolize_names:true)
    group_create_path = ENV['POF_BE'] + '/api/v1/groups?name=Flipadelphia'
    stub_request(:post, group_create_path).to_return(status: 200, body: group_create_json_response)

    user_group_create_json_response_1 = JSON.parse(File.read('spec/fixtures/groups/new/user_group_create_success_1.json'), symbolize_names:true)
    user_group_path_1 = ENV['POF_BE'] + '/api/v1/user_groups?user_id=1&group_id=166'
    stub_request(:post, user_group_path_1).to_return(status: 200, body: user_group_create_json_response_1)

    user_group_create_json_response_2 = JSON.parse(File.read('spec/fixtures/groups/new/user_group_create_success_2.json'), symbolize_names:true)
    user_group_path_2 = ENV['POF_BE'] + '/api/v1/user_groups?user_id=8&group_id=166'
    stub_request(:post, user_group_path_2).to_return(status: 200, body: user_group_create_json_response_2)

    user_group_create_json_response_3 = JSON.parse(File.read('spec/fixtures/groups/new/user_group_create_success_3.json'), symbolize_names:true)
    user_group_path_3 = ENV['POF_BE'] + '/api/v1/user_groups?user_id=9&group_id=166'
    stub_request(:post, user_group_path_3).to_return(status: 200, body: user_group_create_json_response_3)

    group_show_json_response = JSON.parse(File.read('spec/fixtures/groups/new/group_show.json'), symbolize_names:true)
    group_details = ENV['POF_BE'] + '/api/v1/groups/166'
    stub_request(:get, group_details).to_return(status: 200, body: group_show_json_response)

    matches_response = JSON.parse(File.read('spec/fixtures/groups/show/no_matches.json'), symbolize_names:true)
    matches_path = ENV['POF_BE'] + '/api/v1/groups/166/matches'
    stub_request(:get, matches_path).to_return(status: 200, body: matches_response)

    visit google_login_path

    visit new_group_path

    within '.groups-creation' do
      fill_in :name, with: 'Flipadelphia'
      check :"8"
      check :"9"
      click_button 'Create Group'
    end

    expect(page).to have_content('Flipadelphia was successfully created.')
    within '.groups-section' do
      expect(page).to have_content('Flipadelphia')
      expect(page).to have_content('Nick King')
      expect(page).to have_content('nickmaxking@gmail.com')
      expect(page).to have_content('Ron Swanson')
      expect(page).to have_content('ron@example.com')
      expect(page).to have_content('Tom Haverford')
      expect(page).to have_content('tom@example.com')
    end
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
