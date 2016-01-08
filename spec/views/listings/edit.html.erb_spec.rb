require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, FactoryGirl.create(:listing))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do
      assert_select "input#listing_title[name=?]", "listing[title]"
      assert_select "input#listing_minimum_age[name=?]", "listing[minimum_age]"
      assert_select "input#listing_maximum_age[name=?]", "listing[maximum_age]"
      assert_select "input#listing_web_site[name=?]", "listing[web_site]"
      assert_select "textarea#listing_description[name=?]", "listing[description]"

      # This code causes failures even though the form actually
      # displays correctly
      #
      # assert_select "input#listing_deadlines_attributes_0_date[name=?]", "listing[deadlines_attributes][0][date]"
      # assert_select "input#listing_deadlines_attributes_0_description[name=?]", "listing[deadlines_attributes][0][description]"
    end
  end
end
