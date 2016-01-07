Given /^I have 1 tasks? in each status category$/ do
  FactoryGirl.create(:task, user_id: @user.id)
  FactoryGirl.create(:task, user_id: @user.id, status: 'In Progress')
  FactoryGirl.create(:task, user_id: @user.id, status: 'Blocking')
  FactoryGirl.create(:task, user_id: @user.id, status: 'Complete')
end

Given /^one task$/ do 
  @task = FactoryGirl.create(:task)
end

Given /^I have a shitload of incomplete tasks$/ do 
  FactoryGirl.create_list(:task, 15, user_id: @user.id)
end

Given /^one of my tasks is blocking$/ do 
  @user.tasks.first.update(:status => 'Blocking')
end

Given /^I have no tasks$/ do 
  @user.tasks.count == 0
end

When /^I visit my tasks page$/ do 
  visit "/users/#{@user.id}/tasks"
end

When /^I create a task called '([^']*)' using the quick\-add form in the '([^']*)' column$/ do |title, column|
  within ".quick-add-form[data-status=#{column}]" do 
    fill_in 'Title', with: title
    click_button 'Create'
  end
end

When /^I submit the quick-add form in the '([^']*)' element$/ do |el|
  within el do 
    within '#new_task' do 
      fill_in "Title", with: "Create a new task"
      click_button "Create"
    end
  end

  # Wait for Ajax request to complete before moving on to
  # the next step
  page.find_link 'Create a new task' 
end

When /^I visit the other user's tasks page$/ do 
  other_uid = User.where.not(:id => @user.id).first.id
  visit "/users/#{other_uid}/tasks"
end

When /^I click the '([^']*)' icon for my 'In Progress' task$/ do |icon|
  within '#in_progress_tasks' do 
    within '.task' do 
      click_link icon
    end
  end

  sleep 1
end

When /^I click the '([^']*)' icon for the first task$/ do |icon|
  within '#task-panel' do 
    within '.task', :match => :first do 
      click_link icon
    end
  end

  sleep 1
end

When /^the task is deleted$/ do 
  @task.destroy
end

Then /^I should see (\d+) tasks? in the '([^' ]*)' column$/ do |count, column|
  within column do 
    expect(page).to have_selector '.task', count: count.to_i
  end
end

Then /^I should not see any tasks in the 'In Progress' column$/ do
  within '#in_progress_tasks' do 
    expect(page).not_to have_selector '.task'
  end
end

Then /^I should have (\d+) tasks$/ do |count|
  expect(@user.tasks.size).to eql count.to_i
end

Then /^there should be (\d+) tasks?$/ do |count|
  expect(Task.count).to eql count.to_i
end

Then /^I should have (\d+) complete tasks?$/ do |count|
  expect(Task.where(user_id: @user.id, status: 'Complete').count).to eql count.to_i
end

Then /^there should be (\d+) complete tasks?$/ do |count|
  expect(Task.where(status: 'Complete').count).to eql count.to_i
end

Then /^the status of the new task should be '([^']*)'$/ do |status|
  expect(Task.last.status).to eql status
end