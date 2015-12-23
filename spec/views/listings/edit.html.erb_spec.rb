require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, FactoryGirl.create(:listing))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do
      assert_select "input#listing_title[name=?]", "listing[title]"
      assert_select "input#listing_web_site[name=?]", "listing[web_site]"
      assert_select "textarea#listing_description[name=?]", "listing[description]"
    end
  end
end
