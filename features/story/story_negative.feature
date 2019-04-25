@negative
Feature: Story

  @create_stories_in_project @delete_project
  Scenario Outline: Update the name of the storie of a project with a name long
    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    And I set up the data:
    """
      {
        "name":"<name>"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the story schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json story
    Examples:
      | name |
      |  |

