@functional_positive @story
Feature: Functional test Positive cases of stories of a project for update

  @create_stories_in_project @delete_project
  Scenario Outline: Update the name of project with 50 characters in name
    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    And I set up the data:
    """
      {
        "name":<name>
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the story schema
    And Sent Data should be the same info of the response
    And I get the same json and compare with the modified json story
    Examples:
      | name |
      | "A" |
      | "<@test 1>" |
      | "Updated the name of the storie of a project with a name long" |


  @create_stories_in_project @delete_project
  Scenario Outline: Update the name of the storie of a project with characters long in name
    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    And I set up the data:
    """
      {
        "description":<description>
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the story schema
    And Sent Data should be the same info of the response
    And I get the same json and compare with the modified json story
    Examples:
      | description |
      | "D" |
      | "123456789" |
      | "</Decription 1/>" |
      | "Updated the description with a description long for the storie of a project" |


  @create_stories_in_project @delete_project
  Scenario Outline: Update the propertly current state of a stories of a project by id of project and id of the storie validd
    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    And I set up the data:
      """
        {
          "current_state": <current_state>
        }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the story schema
    And Sent Data should be the same info of the response
      Examples:
        | current_state |
        | "unstarted" |
        | "unscheduled" |
