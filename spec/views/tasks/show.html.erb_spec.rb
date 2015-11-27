require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :title => "Title",
      :status => "In Progress",
      :priority => "Normal",
      :notes => "Notes",
      :position => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Priority/)
    expect(rendered).to match(/Notes/)
    expect(rendered).to match(/1/)
  end
end
