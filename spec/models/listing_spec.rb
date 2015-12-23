require 'rails_helper'

RSpec.describe Listing, type: :model do
  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :web_site }

  it 'is invalid without a title' do 
    listing = Listing.new
    expect(listing).not_to be_valid
  end
end
