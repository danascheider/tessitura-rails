Given /^there are (\d+) upcoming deadlines$/ do |count|
  FactoryGirl.create_list(:upcoming_deadline, count.to_i)
end

Given /^there are (\d+) past deadlines$/ do |count|
  FactoryGirl.create_list(:past_deadline, count.to_i)
end

Given /^the listing has a deadline$/ do 
  @deadline = FactoryGirl.create(:deadline, listing: @listing)
end

Given /^the task has a deadline$/ do 
  @deadline = FactoryGirl.create(:deadline, task: @task)
end

Then /^the deadline should be deleted too$/ do 
  expect(Deadline.count).to be 0
end