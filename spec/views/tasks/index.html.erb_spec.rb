require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    @user = FactoryGirl.create(:user)
    assign(:tasks, FactoryGirl.create_list(:task, 2, :title => "Task Title", :status => "In Progress", :priority => "High", :user_id => @user.id))
  end

  it "renders a list of tasks" do
    allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(@user)
    render
    assert_select "li", :text => /Task Title/, :count => 2
    assert_select "li", :text => /In Progress/, :count => 2
    assert_select "li", :text => /#{Task.first.display_deadline}/
    assert_select "li", :text => /#{Task.last.display_deadline}/
    assert_select "li", :text => /High/, :count => 2
  end
end
