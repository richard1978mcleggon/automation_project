Feature: Job Search on indeed.com

  @job_search @regression
  Scenario: Search for job
    Given I visit indeed website
    When I search for "tester" job type
    Then I verify job search results page appears