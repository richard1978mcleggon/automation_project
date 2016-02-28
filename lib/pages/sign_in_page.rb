class SignInPage
  include PageObject
  include DataMagic

  link    :goto_create_account,                 :text       =>      'Create an account free'
  text_field  :email_address,                   :id         =>      'signin_email'
  text_field  :password,                        :id         =>      'signin_password'
  button  :sign_in,                             :value      =>      'Sign In'

  expected_element  :goto_create_account

  def initialize_page
    has_expected_element?
  end

  def signed_in_user
    DataMagic.yml_directory = './lib/config/data'
    @data_yml = DataMagic.load "user.yml"

    populate_page_with data_for :Valid_User
    sign_in
  end

end