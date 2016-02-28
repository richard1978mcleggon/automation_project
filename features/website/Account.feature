Feature: Account Functionality on indeed.com

  @create_account
  Scenario: Create an account
    Given I visit indeed website
    Then I create a new user account

  @sign_in
  Scenario: Sign in as a valid user
    Given I visit indeed website
    Then I sign in with valid credentials






















#  Scenario: Data driven with yml
#    When I open automationpractice website
#    And click contact us
#    Then I contact the customer service with yml dataset "DataSet1"
#
#  Scenario Outline: Data driven with yml and data sets
#    When I open automationpractice website
#    And click contact us
#    Then I contact the customer service with yml dataset "<data_set>"
#  Examples:
#    |data_set|
#    |DataSet1|
#    |DataSet2|

#  Scenario: Data driven with excel
#    When I open automationpractice website
#    And click contact us
#    Then I contact the customer service with excel row "1" dataset
#
#  Scenario Outline: Data driven with excel and data sets
#    When I open automationpractice website
#    And click contact us
#    Then I contact the customer service with excel row "<row_index>" dataset
#  Examples:
#    |row_index|
#    |2|
#    |3|