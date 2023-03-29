class LoginPage
  def username_link
    $browser.find_link("Forgotten Password")
  end

  def username_textbox
    $browser.find_field(id: "input-email")
  end

  def password_textbox
    $browser.find_field(id: "input-password")
  end

  def login_button
    $browser.find(:xpath, '//input[@value="Login"]')
  end

  def account_header
    $browser.find(:xpath, '/html/body/div[1]/div[5]/div[1]/div/div/div[1]/h2')
  end
end
