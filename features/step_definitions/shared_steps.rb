Given /^I have an active account$/ do 
  @user = FactoryGirl.create(:user)
end

Given /^I have clicked the '([^']*)' link$/ do |text|
  click_link text
end

When /^I double-click the '([^']*)' element$/ do |el|
  page.find(el).double_click
end

When /^I navigate to the dashboard$/ do 
  visit "/users/#{@user.id || 1}/dashboard"
end

Then /^I should be on the homepage$/ do 
  expect(current_path).to eql '/'
end

Then /^I should be redirected to the homepage$/ do 
  step 'I should be on the homepage'
end