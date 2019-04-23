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
    And I validated the epic schema


  @create_project @delete_project
  Scenario: Create a new Epic with little name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name" : "{little_name_epic}"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I validated the epic schema


