

@security 
Feature: security test. Token generation test

Scenario: generate token with valid user name and passwsord

	Given url "https://tek-insurance-api.asurewebsites.net"
	And path "/api/token"
	And request {"username": "supervisor", "password": "tek_supervisor"}
	When method post
	Then status 200
	And print response
	
Scenario: Test Api endpoint with invalid username and valid password
 
  Given url "https://tek-insurance-api.azurewebsites.net"
	And path "/api/token"
	And request {"username": "1234", "password": "tek_supervisor"}
	When method post
	Then status 404
	And print response
	
   Scenario: Test Api endpoint with invalid username and valid password
   Given url "https://tek-insurance-api.azurewebsites.net"
	And path "/api/token"
	And request {"username": "1234", "password": "tek_supervisor"}
	When method post
	Then status 404
	And print response
	* def errorMassage = response.errorMassage
  And assert errorMassage== "USER_NOT_FOUND"