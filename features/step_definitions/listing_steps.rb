Given /^I am not logged in$/ do 
  delete destroy_user_session_path
end

Given /^there are (\d+) listings$/ do |count|
  FactoryGirl.create_list(:listing, count.to_i)
end

When /^I visit the listings page$/ do 
  visit listings_path
end