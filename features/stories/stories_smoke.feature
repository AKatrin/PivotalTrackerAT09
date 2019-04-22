@smoke
Feature: Stories Smoke Tests

#  @create_project
#  Scenario: Post Stories by Ids
#    Given I set up a "POST" request to "/projects/{id}/stories" endpoint
#    And I set up the data:
#      """
#        {
#        "name": "Exhaust ports are ray shielded 👹"
#        }
#      """
#    When I send the request
#    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by Id for bullk
    Given I set up a "GET" request to "/projects/{id}/stories/bulk?ids={id_story}" endpoint
    When I send the request
    Then I get a "200" status code as response

#  @delete_project
#  Scenario: Get Stories by Id
#    Given I set up a "GET" request to "/projects/{id}/stories" endpoint
#    When I send the request
#    Then I get a "200" status code as response
