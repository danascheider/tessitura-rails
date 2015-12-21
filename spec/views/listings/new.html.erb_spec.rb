require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input#listing_title[name=?]", "listing[title]"

      assert_select "input#listing_description[name=?]", "listing[description]"
    end
  end
end
