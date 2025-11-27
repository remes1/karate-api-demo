@regression
Feature: Users API tests

  Background:
    * url baseUrl
    * header Authorization = 'Bearer ' + accessToken.response.accessToken
    * def utils = read('utils/helper.js')
    * def userTemplate = read('utils/userTemplate.json')

  Scenario: Get all users, get random user, update user, partially update user and delete user
    # 1 Get all users
    And path '/users'
    When method get
    Then status 200
    * def users = response.users
    * match users != []
    * match each users contains userTemplate

    # 2 Select random user
    * def randomUser = utils.getRandomUser(users)
    * def randomUserId = randomUser.id

    # 3 Get data of selected user
    And path '/users', randomUserId
    When method get
    Then status 200
    * match response.id == randomUserId
    * match each users contains userTemplate

    # 4 Update first and last name
    * def randomFirstName = utils.randomFirstName()
    * def randomLastName = utils.randomLastName()
    * def updateData =
    """
    {
      "firstName": "#(randomFirstName)",
      "lastName": "#(randomLastName)"
    }
    """
    And path '/users', randomUserId
    And request updateData
    When method put
    Then status 200
    * match response.firstName == randomFirstName
    * match response.lastName == randomLastName

    # 5 Partially update of user's age
    * def randomAge = utils.randomAge()
    * def patchData =
    """
    {
      "age": #(randomAge)
    }
    """
    And path '/users', randomUserId
    And request patchData
    When method patch
    Then status 200
    * match response.age == randomAge

    # 6 Delete user
    And path '/users', randomUserId
    When method delete
    Then status 200
    * match response.isDeleted == true