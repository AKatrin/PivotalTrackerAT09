@positive
Feature: Functional Test Positive Cases of Create, Read, Update and Delete Projects


  @create_project @delete_project
  Scenario Outline: : Update the name of project with extreme characters in name
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
        "name": "<name>"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json
    Examples:
    |name|
    |This is an example of a name of project in pivotal|
    |A|


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
    |Sunday|
    |Monday|
    |Tuesday|
    |Wednesday|
    |Thursday |
    |Friday   |
    |Saturday |



  @create_project @delete_project
  Scenario: Update the "point scale" of project with 49 characters and 12 values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "point_scale": "100,101,103,104,105,106,107,108,109,110,111,112"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json


  @create_project @delete_project
  Scenario Outline: Update to false the param of "bugs_and_chores_are_estimatable" of project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "bugs_and_chores_are_estimatable": <Boolean>
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json
    Examples:
    |Boolean|
    | true |
    | false |


  @create_project @delete_project
  Scenario Outline: Update to false the param of "automatic_planning" of project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "automatic_planning": <Boolean>
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json
    Examples:
    |Boolean|
    | true |
    | false |



  @create_project @delete_project
  Scenario: Update the "point scale" of project with 49 characters and 12 values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "description": "This is a configuration for this test"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json