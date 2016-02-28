Feature: Account Functionality on indeed.com

  @create_account
  Scenario: Create an account
    Given I visit indeed website
    Then I create a new user account

  @sign_in @regression
  Scenario: Sign in as a valid user
    Given I visit indeed website
    Then I sign in with valid credentials