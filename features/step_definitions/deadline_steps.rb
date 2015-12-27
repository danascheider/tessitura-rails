Given /^there are (\d+) upcoming deadlines$/ do |count|
  FactoryGirl.create_list(:upcoming_deadline, count.to_i)
end

Given /^there are (\d+) past deadlines$/ do |count|
  FactoryGirl.create_list(:past_deadline, count.to_i)
end