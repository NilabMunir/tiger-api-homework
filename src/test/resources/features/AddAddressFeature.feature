Feature: add address to created account

Background: Create new account 
Given url "https://tek-insurance-api.azurewebsites.net"
* def createAccountResult = callonce read('faker.feature')
And print createAccountResult
* def primaryPersonId = createAccountResult.response.id
* def token = createAccountResult.result.response.token

 Scenario: add address to an account 
 Given path "/api/accounts/add-account-address"
 And param primaryPersonId = primaryPersonId
 And header Authorization = "Bearer " + token
 And request
 """
 {
  "id": 0,
  "addressType": "home",
  "addressLine1": "12345 fox glove Ct",
  "city": "Woodbridge",
  "state": "Virginia",
  "postalCode": "22193",
  "countryCode": "001",
  "current": true
}
 """
 When method POST
 Then status 201
 And print response