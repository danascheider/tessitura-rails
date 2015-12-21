When /^I double-click on the '([^']*)' field$/ do |field|
  within "span##{field}" do 
    find('span.p').double_click
  end
end

Then /^an input should appear in the (.*) field$/ do |field|
  type_of_input = field == 'state' ? 'select' : 'input'

  within "span##{field}" do 
    expect(page).to have_css type_of_input
  end
end

Then /^the input should contain my (.*)$/ do |attribute|
  form_element = attribute == 'state' ? 'select' : 'input'

  expect(find(form_element).value).to eql user_attribute = @user.send(attribute.to_sym).to_s
end

Then /^I should not see the '([^']*)' element in the ([^']*) field$/ do |element, field|
  within "##{field}" do 
    expect(page).not_to have_selector element
  end
end