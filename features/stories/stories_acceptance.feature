# Created by Cxriss7ian at 21/4/2019
@acceptance @stories
Feature: Stories Acceptance Test

#  @create_stories
#  Scenario: Get Stories by Id for bullk
#    Given I set up a "GET" request to "/projects/{proj_id}/stories/bulk?ids={id_story}%2C{id2}%2C{id3}%2C{id4}%2C{id5}" endpoint
#    When I send the request
#    Then I get a "200" status code as response

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
    Given I set up a "GET" request to "/projects/{proj_id}/stories?after_story_id=553&before_story_id=551&with_label=mnt" endpoint
    When I send the request
    Then I get a "200" status code as response