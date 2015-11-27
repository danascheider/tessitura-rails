require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :title => "Title",
        :status => "In Progress",
        :priority => "High",
        :notes => "Notes",
        :position => 1
      ),
      Task.create!(
        :title => "Title",
        :status => "In Progress",
        :priority => "High",
        :notes => "Notes",
        :position => 1
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "In Progress".to_s, :count => 2
    assert_select "tr>td", :text => "High".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
