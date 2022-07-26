Feature: create a token 
 
 Scenario: create a valid token 
 Given url "https://tek-insurance-api.azurewebsites.net"
 And path "api/token"
 And request {"username": "supervisor","password": "tek_supervisor"}
 When method POST
 Then status 200
 And print response 
 * def generatedToken = response.token