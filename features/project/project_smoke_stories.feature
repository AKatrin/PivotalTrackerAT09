@smoke
Feature: Stories Smoke Tests

  @get @stories
  Scenario: Get Stories by Id
    Given I set up a "GET" request to "/projects/{id}/stories" endpoint
    When I send the request
    Then I get a "200" status code as response

  @get @stories
  Scenario: Get Stories by Id for bullk
    Given I set up a "GET" request to "projects/{id}/stories/bulk?ids={id_story}%2C553%2C2%2C0" endpoint
    When I send the request
    Then I get a "200" status code as response

  @post @stories
  Scenario: Post Stories
    Given I set up a "POST" request to "projects/{id}/stories/bulk?ids={id_story}%2C553%2C2%2C0" endpoint
    When I send the request
    Then I get a "200" status code as response
