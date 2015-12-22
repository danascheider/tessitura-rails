Given /^I have an active account$/ do 
  @user = FactoryGirl.create(:user)
end

Given /^I am a logged-in user$/ do 
  step 'I have an active account'
  step 'I am logged in'
end

Given /^I am a logged-in admin$/ do 
  @user = FactoryGirl.create(:admin)
  step 'I am logged in'
end

Given /^I am a logged-in user with (\d+) tasks$/ do |count|
  step 'I have an active account'
  FactoryGirl.create_list(:task, count.to_i, user_id: @user.id)
  step 'I am logged in'
end

Given /^I have clicked the '([^']*)' link$/ do |text|
  click_link text
end

Given /^I have (\d+) complete tasks?$/ do |count|
  FactoryGirl.create_list(:task, count.to_i, user_id: @user.id, status: 'Complete')
end

Given /^there is one other user$/ do 
  FactoryGirl.create(:user)
end

When /^I double-click the '([^']*)' element$/ do |el|
  page.find(el).double_click
end

When /^I navigate to the dashboard$/ do 
  visit "/users/#{@user.id}/dashboard"
end

Then /^I should be on the homepage$/ do 
  expect(current_path).to eql '/'
end

Then /^I should be redirected to a login page$/ do 
  expect(current_path).to eql '/users/sign_in'
end

Then /^I should be redirected to my dashboard$/ do 
  expect(current_path).to eql "/users/#{@user.id}/dashboard"
end

Then /^I should not be rerouted to my dashboard$/ do 
  expect(current_path).not_to match(/dashboard/)
end

Then /^I should still be on my tasks page$/ do 
  expect(current_path).to eql user_tasks_path(@user)
end