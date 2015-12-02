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

      assert_select "select#task_status[name=?]", "task[status]"

      assert_select "select#task_priority[name=?]", "task[priority]"

      assert_select "input#task_notes[name=?]", "task[notes]"

      assert_select "input#task_position[name=?]", "task[position]"
    end
  end
end
