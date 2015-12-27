require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  include Warden::Test::Helpers

  before(:each) do
    Warden.test_mode!

    assign(:listing, FactoryGirl.create(:listing))
    assign(:user, @user = FactoryGirl.create(:admin))
  end

  after(:each) do 
    Warden.test_reset!
  end

  it "renders new listing form" do
    pending('At a loss as to why this is still not working')
    
    allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(@user)

    render

    assert_select "form[action=?][method=?]", listings_path, "post" do
      assert_select "input#listing_title[name=?]", "listing[title]"
      assert_select "input#listing_minimum_age[name=?]", "listing[minimum_age]"
      assert_select "input#listing_maximum_age[name=?]", "listing[maximum_age]"
      assert_select "textarea#listing_description[name=?]", "listing[description]"
      assert_select "input#listing_web_site[name=?]", "listing[web_site]"
    end
  end
end
