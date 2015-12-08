Given /^I have 1 tasks? in each status category$/ do
  FactoryGirl.create(:task, user_id: @user.id)
  FactoryGirl.create(:task, user_id: @user.id, status: 'In Progress')
  FactoryGirl.create(:task, user_id: @user.id, status: 'Blocking')
  FactoryGirl.create(:task, user_id: @user.id, status: 'Complete')
end

When /^I visit my tasks page$/ do 
  visit "/users/#{@user.id}/tasks"
end

When(/^I create a task called '([^']*)' using the quick\-add form in the '([^']*)' column$/) do |title, column|
  within ".quick-add-form[data-status=#{column}]" do 
    fill_in 'Title', with: title
    click_button 'Create'
  end
end

When /^I visit the other user's tasks page$/ do 
  other_uid = User.where.not(:id => @user.id).first.id
  visit "/users/#{other_uid}/tasks"
end

When(/^I click the '([^']*)' icon for my 'In Progress' task$/) do |icon|
  within '#in_progress_tasks' do 
    within '.task' do 
      click_link icon
    end
  end
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

Then /^there should be (\d+) tasks?$/ do |count|
  expect(Task.count).to eql count.to_i
end

Then /^there should be (\d+) complete tasks?$/ do |count|
  expect(Task.where(status: 'Complete').count).to eql count.to_i
end

Then /^the status of the new task should be '([^']*)'$/ do |status|
  expect(Task.last.status).to eql status
end