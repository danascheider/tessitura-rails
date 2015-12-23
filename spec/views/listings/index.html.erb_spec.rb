require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, FactoryGirl.create_list(:listing, 2))
    assign(:user, FactoryGirl.create(:user))
  end

  it "renders a list of listings" do
    render
    assert_select ".listing", :count => Listing.count
  end
end
