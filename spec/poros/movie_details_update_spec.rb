require 'rails_helper'

describe 'movie details update' do
  it 'has readable attributes' do
    data = {
      movies_updated: 7,
      update_status: 'Completed'
    }

    update = MovieDetailsUpdate.new(data)

    expect(update.movie_count).to eq(7)
    expect(update.status).to eq('Completed')
  end
end
