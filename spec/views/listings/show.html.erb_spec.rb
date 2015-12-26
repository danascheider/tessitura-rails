require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    @listing = assign(:listing, FactoryGirl.create(:listing))
    @user = assign(:user, FactoryGirl.create(:user))
  end

  it "renders attributes in <p>" do
    allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(@user)
    render
    expect(rendered).to match(/#{@listing.title}/)
    expect(rendered).to match(/#{@listing.description}/)
  end
end
