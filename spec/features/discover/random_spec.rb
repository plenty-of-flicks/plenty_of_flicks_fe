require 'rails_helper'

describe 'discover random' do
  it 'swipe left button redirects back to discover random', :vcr do
    stub_omniauth

    visit google_login_path

    visit discover_random_path

    within '.swipe-left-link' do
      click_link
    end

    expect(current_path).to eq(discover_random_path)
  end

  it 'swipe right button redirects back to discover random', :vcr do
    stub_omniauth

    visit google_login_path

    visit discover_random_path

    within '.swipe-right-link' do
      click_link
    end

    expect(current_path).to eq(discover_random_path)
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
