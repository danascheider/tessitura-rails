require 'rails_helper'

RSpec.describe "Deadlines", type: :request do
  let(:listing) { FactoryGirl.create(:listing) }
  let(:valid_attributes) { { date: Date.current, listing_id: listing.id} }

  describe "POST /listings/:id/deadlines" do
    it "redirects" do
      post listing_deadlines_path(listing), { :deadline => valid_attributes }
      expect(response).to have_http_status(302)
    end

    it "routes to the listing" do 
      post listing_deadlines_path(listing), { :deadline => valid_attributes }
      expect(response).to redirect_to listing_path(listing)
    end
  end
end
