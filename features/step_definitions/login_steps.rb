When /^I submit the login form with my credentials$/ do 
  within '#login-form' do 
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button 'Sign In'
  end
end