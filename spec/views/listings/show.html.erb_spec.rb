require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    @listing = assign(:listing, FactoryGirl.create(:listing_with_all_attributes))
    @user = assign(:user, FactoryGirl.create(:user))
  end

  it "renders attributes in <p>" do
    allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(@user)
    render
    expect(rendered).to match(/#{@listing.title}/)
    expect(rendered).to match(/#{@listing.description}/)
    expect(rendered).to match(/Create task/)
    expect(rendered).to match(/#{@listing.web_site}/)
    expect(rendered).to match(/#{@listing.application_url}/)
    expect(rendered).to match(/Deadline/)
    expect(rendered).to match(/Minimum Age/)
    expect(rendered).to match(/Maximum Age/)
  end
end
