Before do
  #@browser = Watir::Browser.new ENV['BROWSER']
  #@browser.window.maximize

  random_user_agent_string = "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1"

  #mobile iphone 6 emulator using chrome
  USER_AGENT = 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1'
  @browser = Selenium::WebDriver.for :chrome, :switches => %W[--user-agent=#{USER_AGENT}]
  @browser.manage.window.resize_to(360, 640)


  ## mobile iphone 6 emulator using gem Webdriver::UserAgent
  # @browser = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :iphone, :orientation => :portrait)

end


After do |scenario|
  if scenario.failed?
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  @browser.manage.delete_all_cookies
  @browser.quit
end



