require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:listings) { FactoryGirl.create_list(:listing, 2) }

  describe "GET /users/:id/favorites" do
    it "assigns the user's favorites as favorites" do 
      Favorite.create! user_id: user.id, listing_id: listings[0].id
      allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(user)
      get user_favorites_path(user)
      expect(assigns(:favorites)).to eq user.listings
    end

    it "returns status 200" do
      allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(user)
      get user_favorites_path(user)
      expect(response).to have_http_status(200)
    end
  end
end
