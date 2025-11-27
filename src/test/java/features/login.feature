@regression
Feature: Login

  Background:
    * def payloads = read('utils/payloads.js')
    * def loginData = payloads.loginPayload(username, password)

  Scenario: Login with valid credentials
    Given url baseUrl
    And path '/auth/login'
    And request loginData
    When method post
    Then status 200
    * def authToken = response.accessToken