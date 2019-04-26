
@acceptance @stories
Feature: Stories Acceptance Test


  Scenario: Post Stories by id of project changed three elements on body
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
    And I verify the stories schema
    And Sent Data should be the same info of the respond

  Scenario: Post Stories by id of project changed with element null
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "description":"test of description",
          "name":"Exhaust ports are ray shielded 👹 2"
        }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the stories schema
    And Sent Data should be the same info of the respond

    Scenario: Post Stories by id of project changed with labels
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "labels":["plans","Inspected by TK-421"],
          "name":"test001"
        }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the stories schema
    And Sent Data should be the same info of the respond

#  Scenario: Post Stories by by id of project
#    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
#    And I set up the data:
#      """
#        {"label_ids":[2008],
#        "name":"Exhaust ports are ray shielded 👹 3"}
#      """
#    When I send the request
#    Then I get a "200" status code as response
#    And I verify the stories schema
##    And Sent Data should be the same info of the respond

  @create_stories
  Scenario: Get Stories by id and with two parameters
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "current_state"
    And I configure the "with_state" with the values "unscheduled"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories_with_filters schema

  @create_stories
  Scenario: Get Stories by id with two parameters
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "current_state,labels,comments,tasks"
    And I configure the "with_state" with the values "unscheduled"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories_with_filters schema

  @create_stories
  Scenario: Get Stories by id and have comments
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "comments(:default,file_attachments(:default,uploader))"
    And I configure the "with_state" with the values "unscheduled"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories_with_filters schema

  @create_stories
  Scenario: Get Stories by id with three parameters
    Given I set up a "GET" request to "/projects/{proj_id}/stories?" endpoint
    And I configure the "after_story_id" with the values "{story_id}"
    And I configure the "before_story_id" with the values "{story_id}"
    And I configure the "with_label" with the values "mnt"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories schema

    #  @create_stories
#  Scenario: Get Stories by Id for bullk
#    Given I set up a "GET" request to "/projects/{proj_id}/stories/bulk?ids={id_story}%2C{id2}%2C{id3}%2C{id4}%2C{id5}" endpoint
#    When I send the request
#    Then I get a "200" status code as response