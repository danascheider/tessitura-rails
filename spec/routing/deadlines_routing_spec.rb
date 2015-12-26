require "rails_helper"

RSpec.describe DeadlinesController, type: :routing do
  let(:listing) { FactoryGirl.create(:listing) }

  describe "routing" do

    it "routes to #create" do
      expect(:post => "/listings/#{listing.id}/deadlines").to route_to("deadlines#create", listing_id: listing.to_param)
    end

    it "routes to #update via PUT" do
      expect(:put => "/deadlines/1").to route_to("deadlines#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/deadlines/1").to route_to("deadlines#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/deadlines/1").to route_to("deadlines#destroy", :id => "1")
    end

  end
end
