When /^I submit the login form with my credentials$/ do 
  within '#new_session' do 
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Sign In'
  end
end