@positive @project
Feature: Functional Test Positive Cases of Update Projects

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

#

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



  Scenario Outline: Update the boolean the param of "bugs_and_chores_are_estimatable" of project
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



  Scenario Outline: Update the boolean the param of "automatic_planning" of project
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



  Scenario: Set a "Description" in a project with the maximum characters [140]
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "description": "extended string[140] in the request body. - A description of the project's content. Entered through the web UI on the Project Settings page."
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json



  Scenario Outline: Update the boolean param of "enable_tasks" of project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "enable_tasks": <Boolean>
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


  Scenario Outline: Update the boolean of the param of "public" of project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "public": <Boolean>
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



    Scenario Outline: Update the integer field of the param of "iteration_length" of project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "iteration_length": <Iteration>
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json
    Examples:
    |Iteration|
    | 1 |
    | 4 |


  Scenario Outline: Update the integer param of "initial_velocity" of project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "initial_velocity": <number>
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json
    Examples:
    |number|
    | 1 |
    | 999 |



  Scenario Outline: Update the integer param of "velocity_averaged_over" of project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "velocity_averaged_over": <number>
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json
    Examples:
    |number|
    | 1 |
    | 3 |


  Scenario Outline: Update the integer param of "number_of_done_iterations_to_show" of project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "number_of_done_iterations_to_show": <number>
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json
    Examples:
    |number|
    | {min_velocity_averaged_over} |
    | 2147483647 |



  Scenario Outline: Update the boolean of the param of "atom_enabled" of project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "atom_enabled": <Boolean>
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



  Scenario Outline: Update the boolean of the param of "enable_incoming_emails" of project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "enable_incoming_emails": <Boolean>
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



  Scenario Outline: Update the parameter of "project_type" of project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "project_type": "<parameter>"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json
    Examples:
    |parameter|
#    |demo|
    |private |
    |public |
    |shared |




    Scenario Outline: Update the Week start day with Start_date in the project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
        "week_start_day":"<day>",
        "start_date" : "<date>"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json
    Examples:
    |day|date|
    |Sunday|2019-04-21 |
    |Monday|2019-04-22 |
    |Tuesday|2019-04-23 |
    |Wednesday|2019-04-24 |
    |Thursday |2019-04-25 |
    |Friday   |2019-04-26 |
    |Saturday |2019-04-27 |



  Scenario: Set a "Time Zone" in a project with existent time zone
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	     "time_zone": {
             "olson_name": "America/La_Paz",
             "offset": "-04:00"
	     }
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
#    And Sent Data should be the same info of the respond
    And I get the same json and compare with the modified json
