require 'rails_helper'

describe 'movie poro' do
  it 'has readable attributes' do
    movie_info = {
      data: {
        id: "4311",
        type: "movie",
        attributes: {
          title: "Woman at War",
          tmdb_id: 348657,
          poster_path: "/9IwRoLxbYF1Vu1KxHt0aLbyeS5u.jpg",
          description: "Halla declares a one-woman-war on the local aluminium industry. She is prepared to risk everything to protect the pristine Icelandic Highlands she loves… Until an orphan unexpectedly enters her life.",
          genres: [
            {
              id: 1,
              name: "Thriller",
              created_at: "2021-04-17T04:01:05.640Z",
              updated_at: "2021-04-17T04:01:05.640Z",
              tmdb_id: 53
            },
            {
              id: 3,
              name: "Drama",
              created_at: "2021-04-17T04:01:05.978Z",
              updated_at: "2021-04-17T04:01:05.978Z",
              tmdb_id: 18
            },
            {
              id: 9,
              name: "Comedy",
              created_at: "2021-04-17T04:01:07.469Z",
              updated_at: "2021-04-17T04:01:07.469Z",
              tmdb_id: 35
            }
          ],
        vote_average: 7.2,
        vote_count: 239,
        year: "2018"
        }
      }
    }

    movie = Movie.new(movie_info)

    expect(movie).to be_a(Movie)
    expect(movie.id).to eq(4311)
    expect(movie.title).to eq('Woman at War')
    expect(movie.tmdb_id).to eq(348657)
    expect(movie.poster_path).to eq('/9IwRoLxbYF1Vu1KxHt0aLbyeS5u.jpg')
    expect(movie.description).to eq('Halla declares a one-woman-war on the local aluminium industry. She is prepared to risk everything to protect the pristine Icelandic Highlands she loves… Until an orphan unexpectedly enters her life.')
    expect(movie.genres).to eq(['Thriller', 'Drama', 'Comedy'])
    expect(movie.vote_average).to eq(7.2)
    expect(movie.vote_count).to eq(239)
    expect(movie.year).to eq('2018')
  end
end
