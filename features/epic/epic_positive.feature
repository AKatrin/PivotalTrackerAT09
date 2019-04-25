@positive
Feature: Epics

  @create_project @delete_project
  Scenario: Create a new Epic with long name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name" : "{long_name_epic}"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
   # And Sent Data should be the same info of the respond
   # And I get the same json and compare with the modified json


  @create_project @delete_project
  Scenario: Create a new Epic with short name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name" : "x"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond

  @create_project @delete_project
  Scenario: Create a new Epic with name and long description.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"{long}",
    "name":"Tractor Beams"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond


  @create_project @delete_project
  Scenario: Create a new Epic with name and short description.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"x",
    "name":"Tractor Beams"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond


  @create_project @delete_project
  Scenario: Create a new Epic with name and empty description.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description": "",
    "name":"Tractor Beams"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
   # And Sent Data should be the same info of the respond


  @create_project @delete_project
  Scenario: Create a new Epic with long name, long description and long label.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"{long}",
    "label":{
              "name":"{long_label_name}"
            },
    "name":"{long_name_epic}"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
    #And Sent Data should be the same info of the respond


  @create_project @delete_project
  Scenario: Create a new Epic with name, long comments
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "comments":[{
                     "text":"{long}"
                  }],
      "name":"PR"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
    #And Sent Data should be the same info of the respond


  @create_epic  @delete_project
  Scenario: Update Epic long name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
     "name" : "{long_name_epic}"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond


  @create_epic  @delete_project
  Scenario: Update Epic short name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
     "name" : "x"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond


  @create_epic  @delete_project
  Scenario: Update Epic long description
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
       "description":"{long}"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond


  @create_epic  @delete_project
  Scenario: Update Epic short description
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
       "description":"x"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond


  @create_epic  @delete_project
  Scenario: Update Epic empty description
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
       "description":""
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    #And Sent Data should be the same info of the respond


  @create_epic  @delete_project
  Scenario: Update Epic long description, long name label and long name epic
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
     "description":"{long}",
     "label":{
              "name":"{long_label_name}"
            },
     "name" : "{long_name_epic}"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    #And Sent Data should be the same info of the respond


