Given /^I am not logged in$/ do 
  delete destroy_user_session_path
end

Given /^there are (\d+) listings$/ do |count|
  FactoryGirl.create_list(:listing, count.to_i)
end

When /^I visit the listings page$/ do 
  visit listings_path
end

When /^I visit the listing creation page$/ do 
  visit new_listing_path
end

When /^I submit the listing creation form with valid attributes$/ do 
  within '#new_listing' do 
    fill_in 'listing_title', with: 'New Listing Title'
    fill_in 'listing_description', with: 'Creating a new listing'
    click_button 'Create Listing'
  end
end

Then /^I should see all (\d+) listings$/ do |count|
  expect(page).to have_css('.listing', count: count.to_i)
end

Then /^I should be redirected to the listings page$/ do 
  expect(current_path).to eql listings_path
end

Then /^there should be (\d+) listings?$/ do |count|
  expect(Listing.count).to eql count.to_i
end

Then /^I should see a message that the listing was created successfully$/ do 
  expect(page).to have_content 'Listing was successfully created'
end