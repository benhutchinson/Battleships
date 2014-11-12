Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I follow "(.*?)"$/) do |link|
  click_link(link) 
end

Then(/^I should see "(.*?)"$/) do |question|
  expect(page).to have_content question
end

Then(/^I should complete a form$/) do
  fill_in('your_name', :with => "/\w/" )
  click_button('register')
end

Then(/^I do not input my name$/) do
  step 'I should see "What\'s your name?"'
  click_button('register')
end

Then(/^I see positioning options$/) do
  expect(page.has_select?('x_co_ordinate')).to be true
  expect(page.has_select?('y_co_ordinate')).to be true
  expect(page.has_select?('orientation')).to be true
end

Then(/^I should submit my choice$/) do
  click_button("Send Your Co-Ordinates")
end
