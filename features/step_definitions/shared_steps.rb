Then /^I should be on the homepage$/ do 
  expect(current_path).to eql '/'
end