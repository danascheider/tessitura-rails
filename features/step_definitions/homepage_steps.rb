Given /^I am on the homepage$/ do 
  visit '/'
end

When /^I click the '([^']*)' link$/ do |link|
  if link == 'Sign Up'
    within 'nav' do 
      click_link 'Sign Up'
    end
  else
    click_link link
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

Then /^I should see the login form$/ do 
  expect(page.find('#new_session')).to be_visible
end

Then /^I should not see the login form$/ do 
  expect(page).not_to have_selector '#new_session', visible: true
end