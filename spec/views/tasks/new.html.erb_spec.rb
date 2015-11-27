require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :title => "MyString",
      :status => "In Progress",
      :priority => "Normal",
      :notes => "MyString",
      :position => 1
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_title[name=?]", "task[title]"

      assert_select "input#task_status[name=?]", "task[status]"

      assert_select "input#task_priority[name=?]", "task[priority]"

      assert_select "input#task_notes[name=?]", "task[notes]"

      assert_select "input#task_position[name=?]", "task[position]"
    end
  end
end
