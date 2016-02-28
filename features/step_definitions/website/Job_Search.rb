Then(/^I search for "([^"]*)" job type$/) do |job_type|
  on(HomePage) do |page|
    page.search_for(job_type)
    page.find_job
  end
end

Then(/^I verify job search results page appears$/) do
  on(SearchResultsPage)
end