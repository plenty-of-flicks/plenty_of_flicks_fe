require 'rails_helper'

describe 'profile edit page' do
  it 'can edit profile', :vcr do
    stub_omniauth

    visit root_path
    click_link('Log In')
    visit profile_edit_path

    fill_in :first_name, with: 'Fake'
    fill_in :last_name, with: 'Name'
    fill_in :email, with: 'fake@example.com'
    fill_in :image, with: 'https://image.shutterstock.com/shutterstock/photos/1036253818/display_1500/stock-photo-image-of-excited-screaming-young-woman-standing-isolated-over-yellow-background-looking-camera-1036253818.jpg'
    click_button 'Update Profile'

    expect(current_path).to eq(profile_path)
    expect(page).to have_content('Your profile information has been updated.')
    expect(page).to have_content('First Name: Fake')
    expect(page).to have_content('Last Name: Name')
    expect(page).to have_content('fake@example.com')
    expect(page).to have_css("img[src*='https://image.shutterstock.com/shutterstock/photos/1036253818/display_1500/stock-photo-image-of-excited-screaming-young-woman-standing-isolated-over-yellow-background-looking-camera-1036253818.jpg']")

    click_button('Edit Profile')

    fill_in :first_name, with: 'Nick'
    fill_in :last_name, with: 'King'
    fill_in :email, with: 'nickmaxking@gmail.com'
    fill_in :image, with: 'https://lh6.googleusercontent.com/-hEH5aK9fmMI/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucntLnugtaOVsqmvJGm89fFbDJ6GaQ/s96-c/photo.jpg'
    click_button 'Update Profile'

    expect(current_path).to eq(profile_path)
    expect(page).to have_content('Your profile information has been updated.')
    expect(page).to have_content('First Name: Nick')
    expect(page).to have_content('Last Name: King')
    expect(page).to have_content('Email: nickmaxking@gmail.com')
    expect(page).to have_css("img[src*='https://lh6.googleusercontent.com/-hEH5aK9fmMI/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucntLnugtaOVsqmvJGm89fFbDJ6GaQ/s96-c/photo.jpg']")
  end

  it 'profile edit page redirects to welcome page if user is not logged in' do
    visit profile_edit_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("You must be logged in to perform that action. Click 'Log In' to log in or create an account.")
  end

  it 'profile update page redirects to welcome page if user is not logged in' do
    visit profile_update_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("You must be logged in to perform that action. Click 'Log In' to log in or create an account.")
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
