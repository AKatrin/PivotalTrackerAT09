@negative
Feature: Functional Testing Negative for Epic and Epics for Post and Put

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
    And I should see a message error: 'name' must be an extended_string


    @create_project @delete_project
    Scenario: Create a new Epic with null name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name" : null
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: Please enter a name for the label.


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
    And I should see a message error: Please enter a name for the label.


  @create_project @delete_project
  Scenario: Create a new Epic with too long name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name" : "{long}"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: This extended_string is too long

  @create_project @delete_project
  Scenario: Create a new Epic with array name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name" : ["XML"]
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: 'name' must be an extended_string

  @create_epic @delete_project
  Scenario: Create a new Epic with the same label name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
     "label": {
                  "name": "Project Epic"
               },
      "name" : "Project Epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: The label 'project epic' is already used by another epic.


  @create_epic @delete_project
  Scenario: Create a new Epic with the same label related to after Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "after_id":{epic_id},
      "label": {
                  "name": "Project Epic"
               },
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: The label 'project epic' is already used by another epic.


  @create_project @delete_project
  Scenario: Create a new Epic with object name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name" : { "name":"John", "age":30, "city":"New York" }
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: 'name' must be an extended_string

  @create_project @delete_project
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
    And I should see a message error: 'name' must be an extended_string

  @create_epic @delete_project
  Scenario: Create a new Epic with the same name label related to after Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "after_id":{epic_id},
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: The label 'project epic' is already used by another epic.

  @create_epic @delete_project
  Scenario: Create a new Epic with empty label related to after Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "after_id":{epic_id},
      "label": {
                  "name": ""
               },
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: Please enter a name for the label.

  @create_epic @delete_project
  Scenario: Create a new Epic with the same label related to before Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "before_id":{epic_id},
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: The label 'project epic' is already used by another epic.


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
    And I should see a message: The 'text' parameter value was 'true' but must be of type 'extended_string'


  @create_project @delete_project
  Scenario: Create a new Epic with name and the comments with numeric value
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
    And I should see a message: "The 'text' parameter value was '123' but must be of type 'extended_string'


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
    And I should see a message error: 'description' must be an extended_string


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
    And I should see a message error: 'description' must be an extended_string


  @create_project @delete_project
  Scenario: Create a new Epic with long name and too long name label
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"{more_long}",
    "label":{
              "name":"{long}"
            },
    "name":"{long}"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: This extended_string is too long

  @create_project @delete_project
  Scenario: Create a new Epic with name, empty description and null label.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"",
    "label":{
              "name":null
            },
    "name":"epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: Can't use content of 'label' parameter.

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
    And I should see a message error: The label 'project epic' is already used by another epic.


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
    And I should see a message error: Name can't be blank


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
    And I should see a message error: 'name' must be an extended_string


  @create_epic  @delete_project
  Scenario: Update Epic null name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "name" : null
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: Name can't be blank


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
    And I should see a message error: 'name' must be an extended_string


  @create_epic  @delete_project
  Scenario: Update Epic too long name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "name" : "{long}"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: This extended_string is too long


  @create_epic @delete_project
  Scenario: Update Epic with too long label name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
     "label": {
                  "name":"{long}"
               },
      "name" : "Project Epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: This string is too long

