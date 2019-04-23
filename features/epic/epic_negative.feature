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


  @create_epic @delete_project
  Scenario: Create a new Epic with the same name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name": "Project Epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response