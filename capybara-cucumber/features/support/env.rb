require 'rubygems'
require 'selenium-webdriver'

Before do |scenario|
  # username= "#{ENV['LT_USERNAME']}"
  # accessToken= "#{ENV['LT_ACCESS_KEY']}"
  # gridUrl = "hub.lambdatest.com/wd/hub"
  #
  # options = Selenium::WebDriver::Options.chrome
  # options.browser_version = "108.0"
  # options.platform_name = "Windows 10"
  # lt_options = {}
  # lt_options[:username] = username
  # lt_options[:accessKey] = accessToken
  # lt_options[:project] = "Capybara Cucumber Tests"
  # lt_options[:sessionName] = "Ruby Capybara Cucumber Tests"
  # lt_options[:build] = "Capybara Cucumber Build"
  # lt_options[:w3c] = true
  # lt_options[:plugin] = "ruby-ruby"
  # options.add_option('LT:Options', lt_options)
  #
  # Capybara.register_driver :chrome do |app|
  #   $browser =  Capybara::Selenium::Driver.new(app,
  #                                  :browser => :remote,
  #                                  :desired_capabilities => options,
  #                                  :url => "https://#{gridUrl}",
  #   )
  # end

  # used for local runs.
  $browser = Capybara::Session.new(:selenium)
end

After do |scenario|
  $browser.quit
end
