Feature: test API endpoints 

Background: 
Given url "https://tek-insurance-api.asurewebsites.net"

Scenario: create new account  with existing email address

Given path "/api/accounts/add-primary-account"
And request {"email": "nilab.munir@yahoo.com","firstName": "nilab","lastName": "munir","title": "tester","gender": "FEMALE","maritalStatus": "MARRIED","employmentStatus": "unemployed","dateOfBirth": "2022-07-18T14:31:49.955Z","new": true}
When method POST
Then status 400
And print response 
* def errorMassage = response.errorMassage
And assert errorMassage == "Bad Request"

Scenario: add car to existing account 
 
 Given path "/api/accounts/add-account-car"
 And param id = 11
 And request {"id": 11,"make": "toyota","model": "2000","year": "2000","licensePlate": "123465"}
 When method POST
 Then status 201
 And print response
 And match response.make == "toyota"
 
 Scenario: add phone to existing account 
 
 Given path "/api/accounts/add-account-phone"
 And param id = 11
 And request {"id": 11,"phoneNumber": "571675234","phoneExtension": null}
 When method POST
 Then status 201
 And print response 
 And assert response.phoneNumber == 571675234
 
 Scenario: add address to existing account 
 
 Given path "/api/accounts/add-account-address"
 And param id = 11
 And request {"id": 11,"addressType": "dale city","addressLine1": "23456 dale city","city": "woodbridge","state": "Virginia","postalCode": "22193","countryCode": "string","current": true}
 When method POST
 Then status 201
 And print response 
 And assert response.city == "woodbridge"
 