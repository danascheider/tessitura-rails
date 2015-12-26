require "rails_helper"

RSpec.describe FavoritesController, type: :routing do
  describe "routing" do
    let(:user) { FactoryGirl.create(:user) }

    it "routes to #index" do
      expect(:get => "/users/#{user.id}/favorites").to route_to("favorites#index", :user_id => user.to_param)
    end

    it "routes to #create" do
      expect(:post => "/users/#{user.id}/favorites").to route_to("favorites#create", :user_id => user.to_param)
    end

    it "routes to #destroy" do
      expect(:delete => "/users/#{user.id}/favorites/1").to route_to("favorites#destroy", :id => "1", :user_id => user.to_param)
    end

  end
end
