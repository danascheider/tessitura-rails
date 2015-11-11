Given /^there are no users$/ do 
  User.count == 0
end

Then /^there should be (\d+) users?$/ do |count|
  expect(User.count).to eql count.to_i
end