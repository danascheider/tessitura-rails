require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    assign(:listings, FactoryGirl.create_list(:listing, 2))
    assign(:user, user)
  end

  it "renders a list of listings" do
    allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(user)
    render
    assert_select ".listing", :count => Listing.count
  end
end
