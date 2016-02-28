class SearchResultsPage
  include PageObject

  div           :refinement_container,                 :id            =>      'refineresults'

  expected_element  :refinement_container

  def initialize_page
    has_expected_element?
  end

end