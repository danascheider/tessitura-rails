Given /^I am on the homepage$/ do 
  visit '/'
end

When /^I click the '([^']*)' link$/ do |link|
  click_link link
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
