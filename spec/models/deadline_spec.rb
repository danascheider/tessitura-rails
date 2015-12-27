require 'rails_helper'

RSpec.describe Deadline, type: :model do
  it { is_expected.to respond_to :date }
  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :listing }

  describe "upcoming scope" do 
    it "includes only upcoming deadlines" do
      upcoming = FactoryGirl.create_list(:upcoming_deadline, 2)
      past = FactoryGirl.create_list(:past_deadline, 2)

      expect(Deadline.upcoming.to_a).to eq upcoming
    end
  end
end
