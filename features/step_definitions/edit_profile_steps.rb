Given /^I am viewing my profile edit form$/ do 
  visit edit_user_path(@user)
end

When /^I change my birthdate to '([^']*)'$/ do |value|
  within ".edit_user" do 
    fill_in 'user_birthdate', with: value
    click_button 'Update Profile'
  end
end

Then /^my birthdate should be '(.*)'$/ do |value|
  expect(@user.reload.birthdate).to eql Date.parse(value)
end