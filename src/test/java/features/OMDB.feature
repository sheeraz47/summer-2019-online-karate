@omdb
Feature: OMDB tests
  
  Background:
    * url 'http://www.omdbapi.com'
    
    Scenario: Verify that user cannot get the without API key
      Given param t = 'Home Alone'
      Given method get
      Then status 401
      
    Scenario: Provide API key and verify that user is able to find a movies by title
      Given param t = 'Home Alone'
      And param apikey = '9f94d4d0'
      When method get
      Then status 200
      And assert response.Title == 'Home Alone'
      And assert response.Rated == 'PG'
    