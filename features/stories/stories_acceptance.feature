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

  Scenario: Post Stories by by id of project
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {"label_ids":[2008],
        "name":"Exhaust ports are ray shielded 👹"}
      """
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by Id and with two parameters
    Given I set up a "GET" request to "/projects/{proj_id}/stories?fields=current_state&with_state=unscheduled" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by Id
    Given I set up a "GET" request to "/projects/{proj_id}/stories?fields=current_state%2Clabels%2Ccomments%2Ctasks&with_state=unstarted" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by Id
    Given I set up a "GET" request to "/projects/{proj_id}/stories?fields=comments%28%3Adefault%2Cfile_attachments%28%3Adefault%2Cuploader%29%29&with_state=unstarted" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by Id
    Given I set up a "GET" request to "/projects/{proj_id}/stories?after_story_id={story_id}&before_story_id={story_id}&with_label=mnt" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Get Stories by Id with after
    Given I set up a "GET" request to "/projects/{proj_id}/stories?after_story_id={story_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify all project schema


  @create_stories
  Scenario: Get Stories by Id with before
    Given I set up a "GET" request to "/projects/{proj_id}/stories?before_story_id={story_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
