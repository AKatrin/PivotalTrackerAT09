
@acceptance @stories
Feature: Acceptance tests for stories with create and read

  Scenario: Create a new stories by id of project changing three elements on body
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

  Scenario: Create a new stories by id of project changing two element
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

  Scenario: Create a new stories by id of project with labels
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

  @create_stories
  Scenario: Read the content of stories and with two parameters
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "current_state"
    And I configure the "with_state" with the values "unscheduled"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories_with_filters schema

  @create_stories
  Scenario: Read the content of the stories with two parameters filtering some fields
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "current_state,labels,comments,tasks"
    And I configure the "with_state" with the values "unscheduled"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories_with_filters schema

  @create_stories
  Scenario: Read the content of stories and with field comments
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "comments(:default,file_attachments(:default,uploader))"
    And I configure the "with_state" with the values "unscheduled"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories_with_filters schema

  @create_stories
  Scenario: Read the content of stories and with three parameters
    Given I set up a "GET" request to "/projects/{proj_id}/stories?" endpoint
    And I configure the "after_story_id" with the values "{story_id}"
    And I configure the "before_story_id" with the values "{story_id}"
    And I configure the "with_label" with the values "mnt"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories schema
