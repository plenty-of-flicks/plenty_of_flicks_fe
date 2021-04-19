require 'rails_helper'

describe 'refresh' do
  it 'has readable attributes' do
    data = {
      data: {
        attributes: {
          name: 'Netflix',
          movie_count: 2000
        }
      }
    }

    refresh = Refresh.new(data)

    expect(refresh.service_name).to eq('Netflix')
    expect(refresh.movie_count).to eq(2000)
  end
end
