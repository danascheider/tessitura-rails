Given /^there are no users$/ do 
  User.count == 0
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

Then /^I should get a confirmation e-mail$/ do 
  expect(UserMailer.deliveries.count).to eql 1
end

Then /^there should be (\d+) users?$/ do |count|
  if count == '1' then @user = User.first;
  else @users = User.all; end

  expect(User.count).to eql count.to_i
end