require 'rails_helper'

describe 'welcome page' do
  it 'has content' do
    visit root_path

    expect(page).to have_content('We all know the struggle.')
  end

  it 'user can log in', :vcr do
    stub_omniauth
    visit root_path
    within'.log-in' do
      expect(page).to have_link
    end
    within '.log-in' do
      click_link
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Welcome, Nick!')
  end

  it 'user can log out', :vcr do
    stub_omniauth
    visit root_path

    within '.log-in' do
      click_link
    end

    within '.log-out' do
      expect(page).to have_link
      click_link
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content('You are now logged out.')
  end

  it 'logged in user can access profile show page from navbar', :vcr do
    stub_omniauth
    visit root_path

    within '.log-in' do
      click_link
    end

    within '.topnav' do
      within '.profile-link' do
        expect(page).to have_link
        click_link
      end
    end

    expect(current_path).to eq(profile_path)
  end

  it 'guest user can not see profile link in navbar' do
    visit root_path

    within '.topnav' do
      expect(page).not_to have_css('.profile-link')
    end
  end

  it 'logged in user can access discover index page from navbar', :vcr do
    stub_omniauth
    visit root_path

    within '.log-in' do
      click_link
    end

    within '.topnav' do
      within '.discover-link' do
        expect(page).to have_link
        click_link
      end
    end

    expect(current_path).to eq(discover_index_path)
  end

  it 'guest user can not see Find Movies link in navbar' do
    visit root_path

    within '.topnav' do
      expect(page).not_to have_css('.discover-link')
    end
  end

  it 'logged in user can access friends index page from navbar', :vcr do
    stub_omniauth
    visit root_path

    within '.log-in' do
      click_link
    end

    within '.topnav' do
      within '.friends-link' do
        expect(page).to have_link
        click_link
      end
    end

    expect(current_path).to eq(friends_path)
  end

  it 'guest user can not see friends link in navbar' do
    visit root_path

    within '.topnav' do
      expect(page).not_to have_css('.friends-link')
    end
  end

  it 'logged in user can access groups index page from navbar', :vcr do
    stub_omniauth
    visit root_path

    within '.log-in' do
      click_link
    end

    within '.topnav' do
      within '.groups-link' do
        expect(page).to have_link
        click_link
      end
    end

    expect(current_path).to eq(groups_path)
  end

  it 'guest user can not see groups link in navbar' do
    visit root_path

    within '.topnav' do
      expect(page).not_to have_css('.groups-link')
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
