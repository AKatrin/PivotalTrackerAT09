@negative
Feature: Negative test for Epic and Epics for Post and Put

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
    And I should see a message error: Please enter a name for the epic.


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
    And I should see a message error: Please enter a name for the epic.


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


#  @create_epic @delete_project
#  Scenario: Create a new Epic with name with spaces
#    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
#    And I set up the data
#    """
#    {
#      "name": "      Project Epic      "
#    }
#    """
#    When I send the request
#    Then I get a "400" status code as response
#    And I should see a messages error: "The label 'project epic' is already used by another epic."


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

# @create_epic @delete_project
#  Scenario: Create a new Epic related to after Epic same epic
#    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
#    And I set up the data
#    """
#    {
#      "after_id":{epic_id},
#      "name":"Project Epic"
#    }
#    """
#
#    And I get the Epic Id created
#    Then I get a "400" status code as response



#  @create_epic @delete_project
#  Scenario: Create a new Epic related to before Epic
#    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
#    And I set up the data
#    """
#    {
#      "before_id":{epic_id},
#      "name":"PR"
#    }
#    """
#    When I send the request
#    And I get the Epic Id created
#    Then I get a "400" status code as response
#    And I verify the epic schema


#  @create_project @delete_project
#  Scenario: Create a new Epic with boolean name
#    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
#    And I set up the data
#    """
#    {
#      "name" : "      hola"
#    }
#    """
#    When I send the request
#    Then I get a "400" status code as response
#    And I compare the name message

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
    And I should see a message error: Please enter a name for the label.


  @create_project @delete_project
  Scenario: Create a new Epic with long name and too long name label
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"",
    "label":{
              "name":"{long}"
            },
    "name":"{long}"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a message error: This extended_string is too long


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
    And I should see a message error: 'name' must be an extended_string
    #Name can't be blank

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