@acceptance @epic
Feature: Epics
  @create_project_epic @delete_project_epic
  Scenario: Create a new Epic with name
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
    And I validated the epic schema
