require 'selenium-webdriver'
require 'watir-webdriver'
require 'rspec'
require 'require_all'
require 'saucelabs'
require 'rubyXL'
require 'webdriver-user-agent'
require 'data_magic'
require 'page-object'
require 'sauce_whisk'

# Need to set default values before requiring page objects that are using expected_element
PageObject.default_element_wait = 30
PageObject.default_page_wait = 60

#require './lib/data_helper'
require_all 'lib'

OR = YAML.load_file './lib/config/object_repository.yml'

# ensuring datahelper module functions can be called from step definitions
World DataHelper

# ensure you can use 'visit', 'on' etc. in step definition
World(PageObject::PageFactory)

# # route is named :the_other_route
# navigate_to(SomePage, :using => :the_other_route)

PageObject::PageFactory.routes = {
    :default => [[HomePage,:goto_sign_in], [SignInPage, :goto_create_account], [CreateAccountPage, :create_user_account], [HomePage, :sign_out_account]],
    :another_route => [[HomePage,:goto_sign_in], [SignInPage, :signed_in_user], [HomePage, :sign_out_account]]
}