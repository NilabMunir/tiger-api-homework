@smoke
Feature: Create Account
   #1)Test API endpoint "/api/accounts/add-primary-account" to add new Account (Same as we do fill the form in UI).
   #Then status code should be 201– CREATED , with response generate account with Email address.
  Background: generate token for all scenarios.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token
  Scenario: Create new Account happy path
    Given path "/api/accounts/add-primary-account"
    And request 
    """
    {
  "id": 0,
  "email": "nilab@yahoo.com",
  "firstName": "munir",
  "lastName": "nilab",
  "title": "student",
  "gender": "FEMALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "unemployed",
  "dateOfBirth": "2022-07-20T00:32:42.111Z",
  "new": true
}
    """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then print response
    Then status 201