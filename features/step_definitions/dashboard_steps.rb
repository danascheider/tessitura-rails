When /^I visit my dashboard$/ do 
  visit dashboard_user_path(@user)
end

Then /^the 'tasks' widget should say I have (\d+) incomplete tasks$/ do |count|
  within 'div.panel[data-name=tasks]' do 
    expect(find('.huge')).to have_content(count)
  end
end