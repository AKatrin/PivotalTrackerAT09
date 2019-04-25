@negative
Feature: Epics

  @create_project @delete_project
  Scenario: Create a new Epic with boolean name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name" : true
    }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_project @delete_project
  Scenario: Create a new Epic with empty name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name" : ""
    }
    """
    When I send the request
    Then I get a "400" status code as response

  @create_project @delete_project
  Scenario: Create a new Epic with long name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name" : "{long}"
    }
    """
    When I send the request
    Then I get a "400" status code as response



  @create_epic @delete_project
  Scenario: Create a new Epic with the numeric name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name": 123
    }
    """
    When I send the request
    Then I get a "400" status code as response

  @create_project @delete_project
  Scenario: Create a new Epic with name and comments with boolean value
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "comments":[{
                     "text": true
                  }],
      "name":"PR"
    }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_project @delete_project
  Scenario: Create a new Epic with name and comments with numeric value
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "comments":[{
                     "text": 123
                  }],
      "name":"PR"
    }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_project @delete_project
  Scenario: Create a new Epic with name and boolean value description.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description": true,
    "name":"Tractor Beams"
    }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_project @delete_project
  Scenario: Create a new Epic with name and numeric value description.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description": 123,
    "name":"Tractor Beams"
    }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_project @delete_project
  Scenario: Create a new Epic with name, empty description and empty label.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"",
    "label":{
              "name":""
            },
    "name":"epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_epic @delete_project
  Scenario: Create a new Epic with name, repeated label associate.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"",
    "label":{
              "name":"Project Epic"
            },
    "name":"Project Epic1"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I compare de label error message


  @create_epic  @delete_project
  Scenario: Update Epic empty name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "name" : ""
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I compare de missing name error message


  @create_epic  @delete_project
  Scenario: Update Epic numerical name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "name" : 123
    }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_epic  @delete_project
  Scenario: Update Epic boolean name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "name" : false
    }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_epic  @delete_project
  Scenario: Update Epic numerical name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "name" : "{long}"
    }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_epic  @delete_project
  Scenario: Update Epic long1 description
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
       "description":"{more_long}"
    }
    """
    When I send the request
    Then I get a "400" status code as response
