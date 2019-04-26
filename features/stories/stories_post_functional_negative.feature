@functional_post_negative @stories
Feature: Functional test Negative cases of stories for create

  Scenario: Create a new stories by id of project with kind and name
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "kind": "label",
          "name": "?"
        }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the stories schema

  Scenario: Create a new stories by id of project with name is empty
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "name": " "
        }
      """
    When I send the request
    Then I get a "400" status code as response
    And I should see a messages error: One or more request parameters was missing or invalid.
    And I Should see the problem: Name can't be blank

  Scenario: Create a new stories by id of project with name is null
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "name": null
        }
      """
    When I send the request
    Then I get a "400" status code as response
    And I should see a messages error: One or more request parameters was missing or invalid.
    And I Should see the problem: Name can't be blank

  Scenario Outline: Create a new stories by id of project with name, story_type and current_state
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "name": "test",
          "story_type": "<value_story_type>",
          "current_state": "<value_current_state>"
        }
      """
    When I send the request
    Then I get a "400" status code as response
    And I should see a messages error: One or more request parameters was missing or invalid.
      Examples:
        | value_story_type | value_current_state |
        |bug|planned|
        |feature|accepted|
        |feature|delivered|
        |feature|finished|
        |feature|started|
        |feature|rejected|
        |feature|planned|
        |chore|delivered|
        |chore|finished|
        |chore|rejected|
        |chore|planned|
        |release|delivered|
        |release|finished|
        |release|started|
        |release|rejected|
        |release|planned|

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
    Then I get a "400" status code as response
    And I should see a messages error: One or more request parameters was missing or invalid.
    And I Should see the problem: <message_problem>
    Examples:
      | value_create_at | message_problem |
      |2000-01-01T00:00:00Z|The date you entered 2000-01-01T00:00:00Z, is too far in the past. Please enter a date after 2005-01-01T00:00:00Z.|
