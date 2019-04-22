# Created by Cxriss7ian at 21/4/2019
@acceptance
Feature: Stories Acceptance Test

  @create_stories
  Scenario: Get Stories by Id for bullk
    Given I set up a "GET" request to "/projects/{id}/stories/bulk?ids={id_story}" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by Id for bullk
    Given I set up a "GET" request to "/projects/{id}/stories/bulk?ids={id_story}%2C{id2}%2C{id3}%2C{id4}%2C{id5}" endpoint
    When I send the request
    Then I get a "200" status code as response