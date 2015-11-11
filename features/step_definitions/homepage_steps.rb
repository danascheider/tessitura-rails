Given /^I am on the homepage$/ do 
  visit '/'
end

When /^I click the '([^']*)' link$/ do |link|
  click_link link
end

When /^I submit the registration form with valid attributes$/ do 
  within '#new_user' do 
    fill_in 'user[username]', with: 'newuser2016'
    fill_in 'user[password]', with: '2016usernew'
    fill_in 'user[password_confirmation]', with: '2016usernew'
    fill_in 'user[email]', with: 'newuser2016@example.com'
    fill_in 'user[email_confirmation]', with: 'newuser2016@example.com'
    fill_in 'user[first_name]', with: 'Frank'
    fill_in 'user[last_name]', with: 'Zappa'
    check 'user[terms]'

    click_button 'Create Account'
  end
end

Then /^I should see the top navbar$/ do 
  expect(page).to have_selector '#navbar-top'
end

Then /^I should see the (\S*) view$/ do |id|
  expect(page).to have_selector "##{id}"
end

Then /^I should see a link to the '([^']*)' view$/ do |title|
  expect(page).to have_selector "a[title='#{title}']"
end