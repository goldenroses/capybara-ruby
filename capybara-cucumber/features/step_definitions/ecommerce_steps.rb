require 'capybara/cucumber'
Capybara.default_driver = :selenium

Given(/^Ecommerce webpage Login Page loads$/) do
  @url = "https://ecommerce-playground.lambdatest.io/index.php?route=account/login"
  $browser.visit(@url)
  $user_session = LoginPage.new
end

Then(/^Ecommerce Login Link is present loaded$/) do
  expect($user_session.username_textbox)
end

Then(/^Correct Username and Password Should Login Successfully (.*) (.*)$/) do |username, password|
  puts "------"
  puts username
  $browser.fill_in 'input-email', visible: false, with: username
  sleep(1)
  $browser.fill_in 'input-password', visible: false, with: password
  sleep(2)
  $user_session.login_button.click
end

And(/^My Account page should display after login$/) do
  expect($user_session.account_header.text).to include("My Account")
end
