@smoke
Feature: Smoke Test of Epic and Epics for CRUD
  @create_project @delete_project
  Scenario: Create a new Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name" : "Test Epic"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response


  @create_epic  @delete_project
  Scenario: Get Epic from project
    Given I set up a "GET" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_epic @delete_project
  Scenario: Get Epic
    Given I set up a "GET" request to "/epics/{epic_id}" endpoint
    When I send the request
    Then I get a "200" status code as response


  @create_epic  @delete_project
  Scenario: Update Epic
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "name" : "Test Epic modified"
    }
    """
    When I send the request
    Then I get a "200" status code as response


  @create_epic  @delete_project
  Scenario: Get all Epics
    Given I set up a "GET" request to "/projects/{proj_id}/epics" endpoint
    When I send the request
    Then I get a "200" status code as response


  @create_epic  @delete_project
  Scenario: Delete epic
    Given I set up a "DELETE" request to "/projects/{proj_id}/epics/{epic_id}/" endpoint
    When I send the request
    Then I get a "204" status code as response