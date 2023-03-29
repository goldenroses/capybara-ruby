require 'minitest/autorun'
require 'selenium-webdriver'
require 'capybara/minitest'

class EcommerceMiniTest < MiniTest::Test
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  def setupTest
    # used for local runs.
    @url = "https://ecommerce-playground.lambdatest.io/index.php?route=account/login"
  end

  def test_login_with_username_and_password
    usernames = ['swapnilbiswas012@gmail.com ', 'himanshi.jainn@rediffmail.com', 'saumya.saran01@gmail.com']
    password = 'LambdaTest123'

    usernames.each do |username|
      setupTest

      @driver.visit @url
      @driver.fill_in 'input-email', visible: false, with: username
      sleep(1)
      @driver.fill_in 'input-password', visible: false, with: password
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