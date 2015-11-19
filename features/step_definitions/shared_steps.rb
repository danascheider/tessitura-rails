Given /^I have clicked the '([^']*)' link$/ do |text|
  click_link text
end

When /^I double-click the '([^']*)' element$/ do |el|
  page.find(el).double_click
end

Then /^I should be on the homepage$/ do 
  expect(current_path).to eql '/'
end