@regression
Feature: Profile

  Background:
    * url baseUrl
    * header Authorization = 'Bearer ' + accessToken.response.accessToken
    * def userTemplate = read('utils/userTemplate.json')

  Scenario: Get profile information
    And path '/auth/me'
    When method get
    Then status 200
    * match response contains userTemplate