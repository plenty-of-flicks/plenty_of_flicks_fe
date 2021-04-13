require 'rails_helper'

describe 'welcome page' do
  it 'has content' do
    visit '/'

    expect(page).to have_content('Plenty of Flicks')
  end
end
