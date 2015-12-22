require 'rails_helper'

RSpec.describe "Listings", type: :request do
  include Warden::Test::Helpers

  let(:admin) { FactoryGirl.create(:admin) }

  before(:each) do 
    Warden.test_mode!
  end

  after(:each) do 
    Warden.test_reset!
  end

  describe "GET /listings" do
    it "works! (now write some real specs)" do
      login_as(admin, scope: :user, run_callbacks: false)
      get listings_path
      expect(response).to have_http_status(200)
    end
  end
end
