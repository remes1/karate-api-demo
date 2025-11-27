@regression
Feature: Login

  Scenario: Login with valid credentials
    * def loginData =
    """
    {
      "username": "#(username)",
      "password": "#(password)"
    }
    """
    Given url baseUrl
    And path '/auth/login'
    And request loginData
    When method post
    Then status 200
    * def accessToken = response.accessToken