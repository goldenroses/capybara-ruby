Feature: Ecommerce login Feature

  Scenario: Verify ecommerce webpage loads and user can sign in
    Given Ecommerce webpage Login Page loads
    And Ecommerce Login Link is present loaded
    Then Correct Username and Password Should Login Successfully <username> <password>
    And My Account page should display after login
    Examples:
      | username                      | password      |
      | swapnilbiswas012@gmail.com    | LambdaTest123 |
      | himanshi.jainn@rediffmail.com | LambdaTest123 |
      | saumya.saran01@gmail.com      | LambdaTest123 |

