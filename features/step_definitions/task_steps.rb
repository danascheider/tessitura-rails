Given /^I have 1 tasks? in each status category$/ do
  FactoryGirl.create(:task, user_id: @user.id)
  FactoryGirl.create(:task, user_id: @user.id, status: 'In Progress')
  FactoryGirl.create(:task, user_id: @user.id, status: 'Blocking')
  FactoryGirl.create(:task, user_id: @user.id, status: 'Complete')
end