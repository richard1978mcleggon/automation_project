Given(/^I visit indeed website$/) do
  visit(HomePage)
  puts @browser.title
end

Then(/^I create a new user account$/) do
  navigate_to(CreateAccountPage).create_user_account
  on(HomePage).sign_out_account
  on(HomePage)
end

Then(/^I sign in with valid credentials$/) do
  navigate_to((SignInPage), :using => :another_route).signed_in_user
  on(HomePage).sign_out_account
  on(HomePage)
end
