require 'selenium-webdriver'
require 'watir-webdriver'
require 'rspec'
require 'require_all'
require 'saucelabs'
require 'rubyXL'
require 'webdriver-user-agent'
require 'data_magic'
require 'page-object'

# Need to set default values before requiring page objects that are using expected_element
PageObject.default_element_wait = 20
PageObject.default_page_wait = 60

#require './lib/data_helper'
require_all 'lib'

OR = YAML.load_file './lib/config/object_repository.yml'

# ensuring datahelper module functions can be called from step definitions
World DataHelper

# ensure you can use 'visit', 'on' etc. in step definition
World(PageObject::PageFactory)