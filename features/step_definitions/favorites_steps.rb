Given /^I have no favorites$/ do 
  @user.listings.count == 0
end

When /^I click '([^']*)'$/ do |text|
  click_link text 
end

Then /^my favorites should include the 1st listing$/ do 
  expect(@user.listings).to include(Listing.first)
end