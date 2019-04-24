@smoke @stories
Feature: Stories Smoke Tests

  Scenario: Post Stories by by id of project
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
        "name": "Exhaust ports are ray shielded 👹"
        }
      """
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get all Stories by id of project
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by by id of project for bullk
    Given I set up a "GET" request to "/projects/{proj_id}/stories/bulk?ids={story_id}" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by Id for bullk
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "current_state,labels,comments,tasks"
    And I configure the "with_state" with the values "unscheduled"
    When I send the request
    Then I get a "200" status code as response
