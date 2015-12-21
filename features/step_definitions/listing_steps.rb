Given /^I am not logged in$/ do 
  delete destroy_user_session_path
end

When /^I visit the listings page$/ do 
  visit listings_path
end