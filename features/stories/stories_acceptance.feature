# Created by Cxriss7ian at 21/4/2019
@acceptance @stories
Feature: Stories Acceptance Test

#  @create_stories
#  Scenario: Get Stories by Id for bullk
#    Given I set up a "GET" request to "/projects/{proj_id}/stories/bulk?ids={id_story}%2C{id2}%2C{id3}%2C{id4}%2C{id5}" endpoint
#    When I send the request
#    Then I get a "200" status code as response

  @create_stories
  Scenario: Post Stories by by id of project
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "current_state":"accepted",
          "estimate":1,
          "name":"Exhaust ports are ray shielded 👹"
        }
      """
    When I send the request
    Then I get a "200" status code as response

  Scenario: Post Stories by by id of project
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "description":null,
          "name":"Exhaust ports are ray shielded 👹"
        }
      """
    When I send the request
    Then I get a "200" status code as response

#  Scenario: Post Stories by by id of project
#    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
#    And I set up the data:
#      """
#        {"label_ids":[2008],
#        "name":"Exhaust ports are ray shielded 👹"}
#      """
#    When I send the request
#    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by Id and with two parameters
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "current_state"
    And I configure the "with_state" with the values "unscheduled"
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by id with two parameters
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "current_state,labels,comments,tasks"
    And I configure the "with_state" with the values "unscheduled"
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by Id
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "comments(:default,file_attachments(:default,uploader))"
    And I configure the "with_state" with the values "unstarted"
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by Id
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "comments(:default,file_attachments(:default,uploader))"
    And I configure the "with_state" with the values "unscheduled"
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by Id
    Given I set up a "GET" request to "/projects/{proj_id}/stories?after_story_id={story_id}&before_story_id={story_id}&with_label=mnt" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by Id with after
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "after_story_id" with the values "{story_id}"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories schema

  @create_stories
  Scenario: Get Stories by Id with before
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "before_story_id" with the values "{story_id}"
    When I send the request
    Then I get a "200" status code as response
