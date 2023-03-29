require 'selenium-webdriver'
require 'capybara/rspec'

RSpec.describe 'Ecommerce Tests' do
  def setupTest ()
    options = Selenium::WebDriver::Options.chrome
    options.browser_version = "108.0"
    options.platform_name = "Windows 10"

    # used for local runs.
    @driver = Capybara::Session.new(:selenium)

    @url = "https://ecommerce-playground.lambdatest.io/index.php?route=account/login"
    @driver.visit @url
    end

  context "Login with username and password" do
    usernames = ['swapnilbiswas012@gmail.com ', 'himanshi.jainn@rediffmail.com', 'saumya.saran01@gmail.com']
    password = 'LambdaTest123'

    usernames.each do |username|
      it "should be able to login with the username and password" do
        setupTest
        @driver.fill_in 'input-email', visible: false, with: username
        sleep(1)
        @driver.fill_in 'input-password', visible: false, with: password
        sleep(1)
        @driver.click_button('Login')
        sleep(5)
        account_header = @driver.find(:xpath, '/html/body/div[1]/div[5]/div[1]/div/div/div[1]/h2')
        expect(account_header.text).to eql("My Account")

        @driver.quit

      end
    end
  end
end

