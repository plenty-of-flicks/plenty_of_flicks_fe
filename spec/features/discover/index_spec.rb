require 'rails_helper'

describe 'discover index' do
  it 'redirects to welcome page if user is not logged in' do
    visit discover_index_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("You must be logged in to perform that action. Click 'Log In' to log in or create an account.")
  end

  it 'random movies button directs to random movie page', :vcr do
    stub_omniauth

    visit google_login_path

    visit discover_index_path

    click_button 'No Filters'

    expect(current_path).to eq(discover_random_path)
    within '.movie-genre' do
      expect(page).to have_content('Genres:')
    end
    within '.movie-rating' do
      expect(page).to have_content('Rating:')
    end
    within '.movie-description' do
      expect(page).to have_content('Description:')
    end
    within '.swipe-left-link' do
      expect(page).to have_link
    end
    within '.swipe-right-link' do
      expect(page).to have_link
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
