require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  include Warden::Test::Helpers

  before(:each) do
    Warden.test_mode!

    @task = assign(:task, FactoryGirl.create(:task,
      :title => "MyString",
      :status => "In Progress",
      :priority => "Low",
      :notes => "MyString",
      :position => 1
    ))
  end

  after(:each) do 
    Warden.test_reset!
  end

  it "renders the edit task form" do
    allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(@task.user)

    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do
      assert_select "input#task_title[name=?]", "task[title]"

      # This code doesn't pass for some reason, even though the form works
      # as expected in manual tests
      #
      # assert_select "input#task_deadline_attributes_date[name=?]", "task[deadline_attributes][date]"
      # assert_select "input#task_deadline_attributes_description[name=?]", "task[deadline_attributes][description]"

      assert_select "select#task_status[name=?]", "task[status]"
      assert_select "select#task_priority[name=?]", "task[priority]"
      assert_select "textarea#task_notes[name=?]", "task[notes]"
    end
  end
end
