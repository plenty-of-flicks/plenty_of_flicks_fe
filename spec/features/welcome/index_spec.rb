require 'rails_helper'

describe 'welcome page' do
  it 'has content' do
    visit root_path

    expect(page).to have_content('Plenty of Flicks')
  end

  it 'user can log in', :vcr do
    stub_omniauth
    visit root_path
    expect(page).to have_link('Log In')
    click_link('Log In')

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Welcome, Nick!')
  end

  it 'user can log out', :vcr do
    stub_omniauth
    visit root_path

    click_link('Log In')

    expect(page).to have_link('Log Out')
    click_link('Log Out')

    expect(current_path).to eq(root_path)
    expect(page).to have_content('You are now logged out.')
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
