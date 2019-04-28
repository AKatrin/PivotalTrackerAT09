@smoke
  Feature: Smoke tests for stories of a project with read, update and delete

  @create_stories_project @delete_project
  Scenario: Get Stories of a project
    Given I set up a "GET" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    When I send the request
    Then I get a "200" status code as response


  @create_stories_project_by_id @delete_project
  Scenario: Update the Storie of a project
    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    And I set up the data:
    """
      {"labels":[{"name":"newnew"},{"name":"labellabel"},{"id":{story_id}}]}
    """
    When I send the request
    Then I get a "200" status code as response


  @create_stories_project @delete_project
  Scenario: Delete Stories by Id storie
    Given I set up a "DELETE" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    When I send the request
    Then I get a "204" status code as response


  @create_stories_project @delete_project
  Scenario: Create a Stories of a project with a owner
    Given I set up a "POST" request to "/projects/{proj_id}/stories/{stories_id}/owners" endpoint
    And I set up the data:
    """
      {"id":{account_id}}
    """
    When I send the request
    Then I get a "200" status code as response


  @create_stories_project @delete_project
  Scenario: Get the stories of a project that belong to a user
    Given I set up a "GET" request to "/projects/{proj_id}/stories/{stories_id}/owners" endpoint
    When I send the request
    Then I get a "200" status code as response

