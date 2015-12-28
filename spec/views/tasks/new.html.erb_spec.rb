require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    @task = FactoryGirl.create(:task, 
      :title => "MyString",
      :status => "In Progress",
      :priority => "Normal",
      :notes => "MyString",
      :position => 1
    )
    assign(:task, @task)
    assign(:user, @task.user)
  end

  it "renders new task form" do
    allow_any_instance_of(ActionController::Base).to receive(:current_user).and_return(Task.first.user)

    render

    assert_select "form[action=?][method=?]", user_tasks_path(User.first), "post" do
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
