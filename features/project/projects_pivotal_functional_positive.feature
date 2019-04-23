@functional_positive
Feature: Functional Test Positive Cases of Create, Read, Update and Delete Projects

  @create_project @delete_project
  Scenario: Update the name of project with 50 characters in name
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
        "name":"This is an example of a name of project in pivotal"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json

  @create_project @delete_project
  Scenario: Update the name of project with one character in name
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
        "name":"A"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json

  @create_project @delete_project
  Scenario Outline: Update the week start day of project with all of days of the week
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
        "week_start_day":"<day>"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json
    Examples:
    |day|
    |   |
