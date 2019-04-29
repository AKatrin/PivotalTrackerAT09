@functional_post_positive @stories
Feature: Functional test Positive cases of stories for create
  Scenario Outline: Create a new stories by id of project with only name
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "name": "<value_name>"
        }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the stories schema
    And Sent Data should be the same info of the response
    Examples:
      | value_name |
      |X|
      |12,3|
      |2*6-5+65/1|
      |https://www.deepl.com|
      |`~!@#$%^&*()_+-={}[]:;\"\|'\\?/>.<,|
      |\"i need to do test to check some \"50\" characters.\"|

 Scenario Outline: Create a new stories by id of project with story_type Bug and current_state valid
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "name": "test",
          "story_type": "bug",
          "current_state": "<value_current_state>"
        }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the stories schema
    And Sent Data should be the same info of the response
      Examples:
        | value_current_state |
        |accepted|
        |delivered|
        |finished|
        |started|
        |rejected|
        |unstarted|
        |unscheduled|

  Scenario Outline: Create a new stories by id of project with story_type Feature and current_state valid
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "name": "test",
          "story_type": "feature",
          "current_state": "<value_current_state>"
        }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the stories schema
    And Sent Data should be the same info of the response
      Examples:
        | value_current_state |
        |unstarted|
        |unscheduled|

Scenario Outline: Create a new stories by id of project with story_type Chore and current_state valid
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "name": "test",
          "story_type": "chore",
          "current_state": "<value_current_state>"
        }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the stories schema
    And Sent Data should be the same info of the response
      Examples:
        | value_current_state |
        |accepted|
        |started|
        |unstarted|
        |unscheduled|

  Scenario Outline: Create a new stories by id of project with story_type Release and current_state valid
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "name": "test",
          "story_type": "release",
          "current_state": "<value_current_state>"
        }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the stories schema
    And Sent Data should be the same info of the response
      Examples:
        | value_current_state |
        |accepted|
        |unstarted|
        |unscheduled|

Scenario Outline: Create a new stories by id of project with name, created_at
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "name": "test007",
          "created_at": "<value_create_at>"
        }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the stories schema
    And Sent Data should be the same info of the response
    Examples:
      | value_create_at |
      |2015-01-01T00:00:00Z|
      |2019-04-27T00:00:00Z|