Before do |scenario|
  ENV['SAUCE'] = 'N/A'

  if ENV['SAUCE'] == 'sauce_lab_testing'
    ENV['WHERE'] = "remote"

    ENV['SELENIUM_PLATFORM'].nil? ? ENV['PLATFORM'] = 'Windows 7' : ENV['PLATFORM'] = ENV['SELENIUM_PLATFORM']
    ENV['SELENIUM_BROWSER'].nil? ? ENV['BROWSER'] = 'chrome' : ENV['BROWSER'] = ENV['SELENIUM_BROWSER']
    ENV['SELENIUM_VERSION'].nil? ? ENV['VERSION'] = '36' : ENV['VERSION'] = ENV['SELENIUM_VERSION']

    job_name = "#{scenario.feature.name} - #{scenario.name}"
    if (ENV['WHERE']=="remote")
      puts "SAUCELABS"
      caps = {:platform => ENV['PLATFORM'], :browserName => ENV['BROWSER'], :version => ENV['VERSION'], :build => ENV['JENKINS_BUILD_NUMBER'], :name => job_name}
      sauce_endpoint = "http://richard1978mcleggon:927de58d-6cc8-4d51-bc79-37e75ff4b8cb@ondemand.saucelabs.com:80/wd/hub"
      @browser = Selenium::WebDriver.for :remote, :url => sauce_endpoint, :desired_capabilities => caps
    else
      puts ENV['BROWSER'].to_sym
      @browser = SauceLabs.selenium_driver(ENV['BROWSER'].to_sym)
    end

  else

    if ENV['BROWSER'] == 'firefox'
      @browser = Selenium::WebDriver.for :firefox
    end

  end

  @browser.manage.window.maximize

end

After do |scenario|

  if ENV['SAUCE'] == 'sauce_lab_testing'
    puts "SESSION"
    puts ENV['SAUCE_ONDEMAND_BROWSERS']
    # puts ENV['SAUCE_USERNAME']
    # puts ENV['SAUCE_ACCESS_KEY']
    # puts @browser.send(:bridge).session_id
    # puts @browser.session_id
    # puts scenario.feature.name
    # puts scenario.name
    # puts ENV['JENKINS_BUILD_NUMBER']
    #
    # sessionid = @browser.session_id
    # job_name = "TEST-#{scenario.feature.name} - #{scenario.name}"
    #
    # puts "SauceOnDemandSession=#{sessionid} job-name=#{job_name}"


    if scenario.passed?
      SauceWhisk::Jobs.pass_job @browser.session_id
    else
      SauceWhisk::Jobs.fail_job @browser.session_id
    end

  else

    if scenario.failed?
      Dir::mkdir('screenshots') if not File.directory?('screenshots')
      screenshot = "#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      @browser.save_screenshot(screenshot)
      embed screenshot, 'image/png'
    end
    @browser.manage.delete_all_cookies

  end

  @browser.quit
end