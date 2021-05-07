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
