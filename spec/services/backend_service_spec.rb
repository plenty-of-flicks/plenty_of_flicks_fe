require 'rails_helper'

describe 'backend service' do
  describe 'class methods' do
    it '.create_swipe', :vcr do
      swipe_params = {
        "rating"=>"0",
        "movie_id"=>"4193",
        "user_id"=>1
      }

      json = BackendService.create_swipe(swipe_params)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_a(Hash)
      expect(json[:data]).to have_key(:id)
      expect(json[:data][:id]).to be_a(String)
      expect(json[:data]).to have_key(:type)
      expect(json[:data][:type]).to eq('swipe')
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to be_a(Hash)
      expect(json[:data][:attributes]).to have_key(:id)
      expect(json[:data][:attributes][:id]).to be_an(Integer)
      expect(json[:data][:attributes]).to have_key(:user_id)
      expect(json[:data][:attributes][:user_id]).to be_an(Integer)
      expect(json[:data][:attributes][:user_id]).to eq(1)
      expect(json[:data][:attributes]).to have_key(:movie_id)
      expect(json[:data][:attributes][:movie_id]).to be_an(Integer)
      expect(json[:data][:attributes][:movie_id]).to eq(4193)
      expect(json[:data][:attributes]).to have_key(:rating)
      expect(json[:data][:attributes][:rating]).to be_an(Integer)
      expect(json[:data][:attributes][:rating]).to eq(0)
    end
  end
end
