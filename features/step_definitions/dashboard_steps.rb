Given /^I am on my dashboard$/ do 
  step "I visit my dashboard"
end

When /^I visit my dashboard$/ do 
  visit dashboard_user_path(@user)
end

Then /^the 'tasks' widget should say I have (\d+) incomplete tasks$/ do |count|
  within 'div.panel[data-target=tasks]' do 
    expect(find('.huge')).to have_content(count)
  end
end

Then /^the '([^']*)' element should display (\d+) tasks$/ do |el, count|
  within el do 
    expect(page).to have_selector('.task', count: count.to_i)
  end
end