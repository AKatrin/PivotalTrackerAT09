@acceptance
  Feature: Create crud for Stories of a project

  @create_stories_project @delete_project
  Scenario: Get Stories of a project
    Given I set up a "GET" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify the story schema

