require 'rails_helper'

describe 'profile page' do
  it 'displays user information', :vcr do
    stub_omniauth

    visit root_path
    within '.log-in' do
      click_link
    end
    visit profile_path

    expect(page).to have_content('First Name: Nick')
    expect(page).to have_content('Last Name: King')
    expect(page).to have_content('Email: nickmaxking@gmail.com')
    expect(page).to have_content('User Image:')
    expect(page).to have_css("img[src*='https://lh6.googleusercontent.com/-hEH5aK9fmMI/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucntLnugtaOVsqmvJGm89fFbDJ6GaQ/s96-c/photo.jpg']")
  end

  it 'redirects to welcome page if user is not logged in' do
    visit profile_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("You must be logged in to perform that action. Click 'Log In' to log in or create an account.")
  end

  it 'edit profile button redirects to profile edit page', :vcr do
    stub_omniauth

    visit root_path
    within '.log-in' do
      click_link
    end
    visit profile_path

    expect(page).to have_button('Edit Profile')
    click_button('Edit Profile')

    expect(current_path).to eq(profile_edit_path)
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
