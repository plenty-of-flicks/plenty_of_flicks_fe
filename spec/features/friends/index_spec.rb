require 'rails_helper'

describe 'friends index' do
  it 'shows top three friends', :vcr do
    stub_omniauth
    json_response = JSON.parse(File.read('spec/fixtures/friends/index/friendslist.json'), symbolize_names:true)
    friendslist_path = ENV['POF_BE'] + '/api/v1/users/1/friends'
    stub_request(:get, friendslist_path).to_return(status: 200, body: json_response)

    visit google_login_path

    visit friends_path

    expect(page).to have_content('Leslie Knope')
    expect(page).to have_content('leslie@example.com')
    expect(page).to have_content('Ron Swanson')
    expect(page).to have_content('ron@example.com')
    expect(page).to have_content('Tom Haverford')
    expect(page).to have_content('tom@example.com')
  end

  it 'successful add friends form returns descriptive flash message', :vcr do
    stub_omniauth
    json_response = JSON.parse(File.read('spec/fixtures/friends/index/friend_add_success.json'), symbolize_names:true)
    friends_create_path = ENV['POF_BE'] + '/api/v1/users/1/friendships?friend_email=ron@example.com'
    stub_request(:post, friends_create_path).to_return(status: 200, body: json_response)

    visit google_login_path

    visit friends_path

    within '.friends-creation' do
      fill_in :email, with: 'ron@example.com'
      click_button 'Add Friend'
    end

    expect(page).to have_content('Ron Swanson has been added to friends list.')
  end

  it 'add friends form with invalid email returns flash error', :vcr do
    stub_omniauth
    json_response = JSON.parse(File.read('spec/fixtures/friends/index/friend_add_invalid_email.json'), symbolize_names:true)
    friends_create_path = ENV['POF_BE'] + '/api/v1/users/1/friendsships?friend_email=ron@example.com'
    stub_request(:post, friends_create_path).to_return(status: 200, body: json_response)

    visit google_login_path

    visit friends_path

    within '.friends-creation' do
      fill_in :email, with: 'ron@example.com'
      click_button 'Add Friend'
    end

    expect(page).to have_content('Invalid email. Friend not added.')
  end

  it 'add friends form when friend has already been created returns flash error', :vcr do
    stub_omniauth
    json_response = JSON.parse(File.read('spec/fixtures/friends/index/friend_add_exists.json'), symbolize_names:true)
    friends_create_path = ENV['POF_BE'] + '/api/v1/users/1/friendships?friend_email=ron@example.com'
    stub_request(:post, friends_create_path).to_return(status: 200, body: json_response)

    visit google_login_path

    visit friends_path

    within '.friends-creation' do
      fill_in :email, with: 'ron@example.com'
      click_button 'Add Friend'
    end

    expect(page).to have_content('You are already friends with Ron Swanson.')
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
