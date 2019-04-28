@functional_get_positive @stories
Feature: Functional test Positive cases of stories for read

  @create_stories
  Scenario: Read the content of stories and with before story id as parameter
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "before_story_id" with the values "{story_id}"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories_with_filters schema

  @create_stories
  Scenario: Read the content of stories and with story id as parameter
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "comments(:default,file_attachments(:default,uploader))"
    And I configure the "with_state" with the values "unscheduled"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories_with_filters schema

  @create_stories
  Scenario: Read the content of stories and with after story id as parameter
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "after_story_id" with the values "{story_id}"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories_with_filters schema

  @create_stories
  Scenario: Read the content of stories and with only id
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "id"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories_with_filters schema

  @create_stories
  Scenario: Read the content of stories and with two parameters with all fields
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "kind,created_at,updated_at,accepted_at,description,estimate,story_type,name,requested_by_id,url,project_id,owner_ids,owned_by_id,labels"
    And I configure the "with_state" with the values "accepted"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories_with_filters schema
