require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :title => "MyString",
      :status => "In Progress",
      :priority => "Low",
      :notes => "MyString",
      :position => 1
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_title[name=?]", "task[title]"

      assert_select "input#task_status[name=?]", "task[status]"

      assert_select "input#task_priority[name=?]", "task[priority]"

      assert_select "input#task_notes[name=?]", "task[notes]"

      assert_select "input#task_position[name=?]", "task[position]"
    end
  end
end
