Given /^I have 1 tasks? in each status category$/ do
  FactoryGirl.create(:task, user_id: @user.id)
  FactoryGirl.create(:task, user_id: @user.id, status: 'In Progress')
  FactoryGirl.create(:task, user_id: @user.id, status: 'Blocking')
  FactoryGirl.create(:task, user_id: @user.id, status: 'Complete')
end

When /^I visit my tasks page$/ do 
  visit "/users/#{@user.id}/tasks"
end

Then /^I should see (\d+) tasks in the '([^'\s])' column$/ do |count, column|
  
end