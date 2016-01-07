Given /^I am not logged in$/ do 
  delete destroy_user_session_path
end

Given /^I am viewing the listing$/ do 
  visit listing_path(@listing)
end

Given /^there are (\d+) listings$/ do |count|
  FactoryGirl.create_list(:listing, count.to_i)
end

Given /^there is 1 listing with a deadline$/ do 
  @listing = FactoryGirl.create(:listing_with_deadline)
end

Given /^there are no listings$/ do 
  expect(Listing.count).to eql 0
end

Given /^there are listings with the following attributes:$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:listing, hash)
  end
end

Given /^I am viewing the 1st listing$/ do 
  visit listing_path(Listing.first)
end

Given /^one listing$/ do 
  @listing = FactoryGirl.create(:listing)
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

When /^I submit the creation form with valid deadline information$/ do 
  within '#new_listing' do 
    fill_in 'listing_title', with: 'New Listing Title'
    fill_in 'listing_deadlines_attributes_0_date', with: Date.current
    fill_in 'listing_deadlines_attributes_0_description', with: 'Materials received'
    click_button 'Create Listing'
  end
end

When /^the listing is deleted$/ do 
  @listing.destroy
end

Then /^I should see all (\d+) listings$/ do |count|
  expect(page).to have_css('.listing', count: count.to_i)
end

Then /^I should only see (\d+) listings?$/ do |count|
  expect(page).to have_css('.listing', count: count.to_i)
end

Then /^I should be redirected to the listings page$/ do 
  expect(current_path).to eql listings_path
end

Then /^there should be (\d+) listings$/ do |count|
  expect(Listing.count).to eql count.to_i
end

Then /^there should be 1 listing$/ do 
  @listing = Listing.first
  expect(@listing).not_to be_nil 
end

Then /^I should see a message that the listing was created successfully$/ do 
  expect(page).to have_content 'Listing was successfully created'
end

Then /^the listing should have (\d+) deadlines?$/ do |count|
  expect(@listing.deadlines.size).to eql count.to_i
end