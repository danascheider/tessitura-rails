Given /^I am on the login page$/ do 
  visit '/users/sign_in'
end

When /^I submit the login form with my credentials$/ do 
  within '#new_session' do 
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Sign In'
  end
end

When /^I try to log in with invalid credentials$/ do 
  step 'I am on the homepage' 
  step "I click the 'Sign In' link"

  within '#new_session' do 
    fill_in 'user[email]', with: 'baddymcbadster@4chan.com'
    fill_in 'user[password]', with: 'reallybadperson666'
    click_button 'Sign In'
  end
end

When(/^I submit the password reset form with my e\-mail address$/) do
  within '#reset_instructions_form' do     # yes, this is what it calls the password reset form
    fill_in 'E-mail Address', with: @user.email
    click_on 'Send me reset instructions'
  end
end

Then /^I should be on the login page$/ do 
  expect(current_path).to eql "/users/sign_in"
end

Then(/^I should see a message that I could not be logged in$/) do
  expect(page).to have_content 'Invalid email or password'
end