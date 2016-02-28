class HomePage
  include PageObject

  page_url ENV['URL']

  div     :top_nav_container,                 :id            =>      'g_nav'
  link    :goto_sign_in,                      :id            =>      'userOptionsLabel'
  button  :find_job,                          :id            =>      'fj'


  expected_element  :find_job

  def initialize_page
    has_expected_element?
  end

  def sign_out_account
    top_nav_container_element.table_element[0][1].span_element(:id => 'userOptionsLabel').click
    wait_until(10, "ERROR: Sign out overlay did not open") {top_nav_container_element.table_element[0][1].span_element(:id => 'userOptionsLabel').attribute('class').include? 'active'}
    top_nav_container_element.table_element[0][1].link_element(:text => 'Sign out').click
  end

end