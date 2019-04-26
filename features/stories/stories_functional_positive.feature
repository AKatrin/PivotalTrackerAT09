@functional_positive @stories
Feature: Functional Test Positive cases of Create and read


  Scenario Outline: Post Stories by id of project with only name
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
    And Sent Data should be the same info of the respond
    Examples:
      | value_name |
      |    X       |
      |   12,3     |
      |2*6-5+65/1|
      |https://www.deepl.com|
      |`~!@#$%^&*()_+-={}[]:;\"\|'\\?/>.<,|
      |\"i need to do test to check some \"50\" characters.\"|

 Scenario Outline: Post Stories by id of project with name, story_type Bug and current_state
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
      Examples:
        | value_current_state |
        |accepted|
        |delivered|
        |finished|
        |started|
        |rejected|
        |unstarted|
        |unscheduled|

  Scenario Outline: Post Stories by id of project with name, story_type feature and current_state
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
      Examples:
        | value_current_state |

        |unstarted|
        |unscheduled|

Scenario Outline: Post Stories by id of project with name, story_type Chore and current_state
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
      Examples:
        | value_current_state |
        |accepted|
        |started|
        |unstarted|
        |unscheduled|

  Scenario Outline: Post Stories by id of project with name, story_type Release and current_state
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
      Examples:
        | value_current_state |
        |accepted|
        |unstarted|
        |unscheduled|

  @create_stories
  Scenario: Get Stories by id with after story id
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "after_story_id" with the values "{story_id}"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories schema

  @create_stories
  Scenario: Get Stories by id with before id
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "before_story_id" with the values "{story_id}"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories schema

  @create_stories
  Scenario: Get Stories by Id
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    And I configure the "fields" with the values "comments(:default,file_attachments(:default,uploader))"
    And I configure the "with_state" with the values "unstarted"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories schema
