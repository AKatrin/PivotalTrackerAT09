@smoke
  Feature: Create crud for Stories of a project

  @create_stories_project @delete_project
  Scenario: Get Stories of a project
    Given I set up a "GET" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_stories_project @delete_project
  Scenario: Get Stories of a project
    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    And I set up the data:
    """
      {"labels":[
      {"name":"newnew"},
      {"name":"labellabel"},
      {"name":"21253987"}]}
    """
    When I send the request
    Then I get a "200" status code as response


  @delete_stories_by_id @delete_project
  Scenario: Delete Stories by Id
    Given I set up a "DEL" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    When I send the request
    Then I get a "204" status code as response


  @create_stories_project @delete_project
  Scenario: Delete Stories by Id
    Given I set up a "DEL" request to "/projects/{proj_id}/stories/{stories_id}/owners" endpoint
    When I send the request
    Then I get a "200" status code as response

