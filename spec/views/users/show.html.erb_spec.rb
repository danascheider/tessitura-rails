require 'rails_helper'

class NilClass
  def empty?; true; end
end

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, FactoryGirl.create(:user))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/E-mail/)
    expect(rendered).to match(/First name/)
    expect(rendered).to match(/Last name/)
    expect(rendered).to match(/Address 1/)
    expect(rendered).to match(/Address 2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/1/)
  end
end
