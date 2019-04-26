@functional_negative @stories
Feature: #

  Scenario: Post Stories by id of project with only name
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


  Scenario: Post Stories by id of project with only name
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "name": " "
        }
      """
    When I send the request
    Then I get a "400" status code as response

  Scenario: Post Stories by id of project with only name
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "name": null
        }
      """
    When I send the request
    Then I get a "400" status code as response

  Scenario Outline: Post Stories by id of project with name, story_type and current_state
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
#    And I verify the stories schema
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
      |    x       |

  Scenario Outline: Post Stories by id of project with name, created_at
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "name": "test007",
          "created_at": "<value_create_at>",
        }
      """
    When I send the request
    Then I get a "400" status code as response

    Examples:
      | value_create_at |
      |2018-04-17T18:56:15Z|
      |2019-04-25T00:00:00Z|