require 'rails_helper'

describe 'groups show page' do
  it 'shows matched movies', :vcr do
    stub_omniauth

    json_response = JSON.parse(File.read('spec/fixtures/groups/index/groups.json'), symbolize_names:true)
    group_list_path = ENV['POF_BE'] + '/api/v1/users/1/groups'
    stub_request(:get, group_list_path).to_return(status: 200, body: json_response)

    x_men_response = JSON.parse(File.read('spec/fixtures/groups/show/x_men.json'), symbolize_names:true)
    x_men_show_path = ENV['POF_BE'] + '/api/v1/groups/159'
    stub_request(:get, x_men_show_path).to_return(status: 200, body: x_men_response)

    x_men_matches_response = JSON.parse(File.read('spec/fixtures/groups/show/x_men_matches.json'), symbolize_names:true)
    x_men_matches_path = ENV['POF_BE'] + '/api/v1/groups/159/matches'
    stub_request(:get, x_men_matches_path).to_return(status: 200, body: x_men_matches_response)

    visit google_login_path

    visit group_path(159)

    expect(page).to have_content('X Men')
    expect(page).to have_content('Nick King')
    expect(page).to have_content('nickmaxking@gmail.com')
    expect(page).to have_content('Ron Swanson')
    expect(page).to have_content('ron@example.com')
    expect(page).to have_content('Austin Powers: International Man of Mystery (1997)')
    expect(page).to have_content('Comedy, Action')
    expect(page).to have_content('Average Rating: 6.5/10')
    expect(page).to have_content('2349 Total Reviews')
    expect(page).to have_content('Nightcrawler (2014)')
    expect(page).to have_content('Thriller')
    expect(page).to have_content('Average Rating: 7.7/10')
    expect(page).to have_content('8018 Total Reviews')
    expect(page).not_to have_content('The Theory of Everything')
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
