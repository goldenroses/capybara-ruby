require 'selenium-webdriver'
require 'test-unit'
require 'capybara/dsl'

class EcommerceTests < Test::Unit::TestCase

  include Capybara::DSL

  def setupTest
    # used for local runs.
    @driver = Capybara::Session.new(:selenium)
    @url = "https://ecommerce-playground.lambdatest.io/index.php?route=account/login"

    @driver.visit @url
  end

  def test_login_with_username_and_password_should_go_to_my_account_page
    usernames = ['swapnilbiswas012@gmail.com ', 'himanshi.jainn@rediffmail.com', 'saumya.saran01@gmail.com']
    password = 'LambdaTest123'

    usernames.each do |username|
      setupTest

      @driver.fill_in 'input-email', with: username
      sleep(1)
      @driver.fill_in 'input-password', with: password
      sleep(1)
      @driver.click_button('Login')
      sleep(5)
      account_header = @driver.find(:xpath, '/html/body/div[1]/div[5]/div[1]/div/div/div[1]/h2')
      assert_equal(account_header.text, "My Account")

      teardown
    end
  end

  def teardown
    @driver.quit
  end
end
