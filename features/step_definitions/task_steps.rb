Given /^I have 1 tasks? in each status category$/ do
  FactoryGirl.create(:task, user_id: @user.id)
  FactoryGirl.create(:task, user_id: @user.id, status: 'In Progress')
  FactoryGirl.create(:task, user_id: @user.id, status: 'Blocking')
  FactoryGirl.create(:task, user_id: @user.id, status: 'Complete')
end

When /^I visit my tasks page$/ do 
  visit "/users/#{@user.id}/tasks"
end

When /^I visit the other user's tasks page$/ do 
  other_uid = User.where.not(:id => @user.id).first.id
  visit "/users/#{other_uid}/tasks"
end

Then /^I should see (\d+) tasks? in the '([^' ]*)' column$/ do |count, column|
  within column do 
    expect(page).to have_selector '.task', count: count.to_i
  end
end