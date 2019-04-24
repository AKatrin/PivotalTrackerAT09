@functional_negative @stories
Feature: #

  Scenario: Post Stories by id of project with only name
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "kind": "stories",
          "name": "x"
        }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the stories schema
