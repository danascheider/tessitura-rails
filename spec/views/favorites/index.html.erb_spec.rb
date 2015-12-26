require 'rails_helper'

RSpec.describe "favorites/index", type: :view do
  let(:user) { FactoryGirl.create(:user) }
  let(:listings) { FactoryGirl.create_list(:listing, 3) }

  before(:each) do
    Favorite.create!(
      :user_id => user.id,
      :listing_id => listings[0].id
    )
    Favorite.create!(
      :user_id => user.id,
      :listing_id => listings[1].id
    )

    assign(:favorites, user.listings)
  end

  it "renders a list of favorites" do
    allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(user)
    render
    assert_select ".listing", count: 2
  end
end
