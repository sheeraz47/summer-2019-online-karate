@spartan
  Feature: practice with spartan app

    Background:
    * url 'http://34.227.143.104:8000'
    
    Scenario: Get all spartans
      Given path '/api/spartans'
      When method get
      Then status 200
      And print response[0]
      
    Scenario: Add new spartan and verify status code 201
      Given path '/api/spartans'
      * def spartan =
      """{
      "name": "SDET",
      "gender": "Male",
      "phone": 12023615117
      }"""
      * request spartan
      When method post
      Then status 201


#    838 - user id to delete
    @delete_spartan
    Scenario: Delete spartan
      Given path '/api/spartans/838'
      When method delete
      Then status 204
      * print response

    @add_spartan_with_external_json
    Scenario: Add new spartan by reading external JSON payload
      Given path '/api/spartans'
      * def spartan = read('../test_data/payloads/spartan.json')
      * request spartan
      When method post
      Then status 201
      Then assert response.success == 'A Spartan is Born!'
      * print response
      