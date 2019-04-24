@acceptance
Feature: Epics
  @create_project @delete_project
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
    And I verify the epic schema


  @create_project @delete_project
  Scenario: Create a new Epic with name and verify
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
    And I set up a "GET" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I send the request
    And I get a "200" status code as response
    And I compare de epic name


  @create_project @delete_project
  Scenario: Create a new Epic with name, description and label name.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"Install tractor beam systems in all landing bays. Beam systems should report to central monitoring.",
    "label":{
              "name":"tractor-beams"
            },
    "name":"Tractor Beams"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema


 @create_project @delete_project
  Scenario: Create a new Epic with name gral
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "comments":[{
                     "text":"Use this image on all external comms"
                  }],
      "name":"PR"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema

   @create_project @delete_project
  Scenario: Create a new Epic with name two comments
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "comments":[{
                     "text":"Use this image on all external comms",
                     "text":"Use this image on all external commss"
                  }],
      "name":"PR"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema


  @create_epic @delete_project
  Scenario: Create a new Epic related to after Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "after_id":{epic_id},
      "name":"PR"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema

  @create_epic @delete_project
  Scenario: Create a new Epic related to before Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "before_id":{epic_id},
      "name":"PR"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema


  @create_epic  @delete_project
  Scenario: Get Epic from project
    Given I set up a "GET" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema

  @create_epic @delete_project
  Scenario: Get Epic
    Given I set up a "GET" request to "/epics/{epic_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema

  @create_epic  @delete_project
  Scenario: Update Epic name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "name" : "Test Epic modified"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema

  @create_epic  @delete_project
  Scenario: Update Epic description
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "description" : "Test description"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema

