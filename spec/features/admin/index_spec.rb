require 'rails_helper'

describe 'admin index' do
  it 'has content' do
    visit admin_index_path

    expect(page).to have_button('Refresh Availability')
  end

  it 'refresh availability link', :vcr do
    visit admin_index_path

    within '#netflix-radio' do
      choose(:service)
    end
    click_button 'Refresh Availability'

    expect(current_path).to eq(admin_index_path)
    expect(page).to have_content('Netflix has been updated')
  end
end
