class CreateAccountPage
  include PageObject
  include DataMagic

  text_field  :email,                     :id       =>      'register_email'
  text_field  :retype_email,              :id       =>      'register_retype_email'
  text_field  :password,                  :id       =>      'register_password'
  button      :create_account,            :value    =>      'Create Account'

  expected_element  :email

  def initialize_page
    has_expected_element?
  end

  def create_user_account
    email_address = Faker::Internet.email
    DataMagic.yml_directory = './lib/config/data'
    @data_yml = DataMagic.load "user.yml"

    populate_page_with :email => email_address, :retype_email => email_address
    populate_page_with data_for :User

    create_account
  end

end