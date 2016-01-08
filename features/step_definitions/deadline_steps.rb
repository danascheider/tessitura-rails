Given /^there are (\d+) upcoming deadlines$/ do |count|
  FactoryGirl.create_list(:upcoming_deadline, count.to_i)
end

Given /^there are (\d+) past deadlines$/ do |count|
  FactoryGirl.create_list(:past_deadline, count.to_i)
end

Given /^the listing has a deadline$/ do 
  @deadline = FactoryGirl.create(:deadline, listing: @listing, task: nil)
end

Given /^the task has a deadline$/ do 
  @deadline = FactoryGirl.create(:deadline, task: @task, listing: nil)
end

Given /^the listing and the task share a deadline$/ do 
  @deadline = FactoryGirl.create(:deadline, task: @task, listing: @listing)
end

Then /^the deadline should be deleted too$/ do 
  expect(Deadline.count).to be 0
end

Then /^the deadline should not be deleted$/ do 
  expect(Deadline.count).to eql 1
end