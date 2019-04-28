@negative @project
Feature: Functional Test Negative Cases of Update Projects

  Scenario Outline: Cannot update the name of project with different characters in name
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
        "name": <name>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "<message>"
    Examples:
    |name|message|
    |1|'name' must be an extended_string|
    |" "|Name can't be blank            |
    |{"name":"another name"}|'name' must be an extended_string|
    |["name", "name2"]|'name' must be an extended_string       |
    |"This is an example of a name of project in pivotal."|This extended_string is too long:  'This is an example of a name of project in pivotal.'|
    | null|Name can't be blank                                                                            |


  Scenario: : Cannot update the name of project with the same existent project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I get a existent project
    And I set up the data:
    """
      {
        "name": "{name_existent}",
        "account_id": {account}
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "The project name you entered is already taken."



  Scenario Outline: Cannot update the week start day of project with different strings
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
        "week_start_day":<day>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "'week_start_day' must be one of: sunday, monday, tuesday, wednesday, thursday, friday, saturday"
    Examples:
    |day|
    |"Sonday"|
    |"123"|
    |"/*"|
    |["Sunday", "Tuesday"]|
    |{"week_start_day":"Tuesday"}|
    |"Sunday,Tuesday" |
    |null |


  Scenario Outline: Cannot update the "point scale" of project strange values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "point_scale": <values>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "<message>"
    Examples:
      |values|message|
      |"-1"|You can't use negative values for points.|
      |"0,5,10,8,20"|Point values must be provided in ascending order.|
      |"100,101,103,104,105,106,107,108,109,110,111,112,113"|There are too many values in this point scale. Please use 12 or fewer values.|
      |"[1,2]"|This is not a valid custom point scale.|
      |"1,2,2,3"|You can't have duplicate point values.|
      |"5,4,3,2,1"|Point values must be provided in ascending order.|
      |true|'point_scale' must be a string|
      |"word,0,1"|This is not a valid custom point scale.|
      |null|Projects require a point scale., This is not a valid custom point scale.|


  Scenario Outline: Cannot update the boolean the param of "bugs_and_chores_are_estimatable" of project with strange values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "bugs_and_chores_are_estimatable": <Boolean>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "'bugs_and_chores_are_estimatable' must be a non-string boolean true or false value"
    Examples:
    |Boolean|
    | "true" |
    | 1 |


  Scenario Outline: Update the boolean the param of "automatic_planning" of project with strange values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "automatic_planning": <Boolean>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "'automatic_planning' must be a non-string boolean true or false value"
    Examples:
    |Boolean|
    | "true" |
    | 1 |

  Scenario: Cannot set a "Description" in a project with more than the maximum characters [140]
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "description": "extended string[140] in the request body. - A description of the project's content. Entered through the web UI on the Project Settings page. "
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "This extended_string is too long:  'extended string[140] in the request body. - A description of the project's content. Entered through the web UI on the Project Settings page. '"


  Scenario Outline: Cannot update the boolean param of "enable_tasks" of project with strange values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "enable_tasks": <Boolean>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "'enable_tasks' must be a non-string boolean true or false value"
    Examples:
    |Boolean|
    | "true" |
    | 1 |

  Scenario Outline: Cannot update the boolean of the param of "public" of project with strange values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "public": <Boolean>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "'public' must be a non-string boolean true or false value"
    Examples:
    |Boolean|
    | "true" |
    | 1 |

  Scenario Outline: Cannot update the integer field of the param of "iteration_length" of project with different values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "iteration_length": <Iteration>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "<message>"
    Examples:
    |Iteration|message|
    | 0 |iteration_length can only be between 1 and 4.|
    | 5 |iteration_length can only be between 1 and 4.|
    |"1"|'iteration_length' must be an integer value  |
    |true|'iteration_length' must be an integer value |


  Scenario Outline: Cannot update the integer param of "initial_velocity" of project with extreme values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "initial_velocity": <number>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "<message>"
    Examples:
    |number|message|
    | 0 |You must specify a value of 1 or greater.|
    | 1000 |Initial velocity can't exceed 999.|
    |"1"|'initial_velocity' must be an integer value  |
    |true|'initial_velocity' must be an integer value |


  Scenario Outline: Cannot update the integer param of "velocity_averaged_over" of project with extreme values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "velocity_averaged_over": <number>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "<message>"
    Examples:
    |number|message|
    | 0 |is not a valid velocity scheme|
    | 5 |is not a valid velocity scheme|
    |"1"|'velocity_averaged_over' must be an integer value  |
    |true|'velocity_averaged_over' must be an integer value |


   Scenario Outline: Cannot update the integer param of "number_of_done_iterations_to_show" of project with extreme values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "number_of_done_iterations_to_show": <number>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "<message>"
    Examples:
    |number|message|
    | 1 |Your project must load enough done iterations to calculate your velocity according to your settings.|
#    This number is the limit + 1 of the integer
    | 2147483648 |The number is exceeded the limit of integers|
    |"letter"    |'number_of_done_iterations_to_show' must be an integer value|
    |true        |'number_of_done_iterations_to_show' must be an integer value|


  Scenario Outline: Cannot update the boolean of the param of "atom_enabled" of project with strange values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "atom_enabled": <Boolean>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "'atom_enabled' must be a non-string boolean true or false value"
    Examples:
    |Boolean|
    | "true" |
    | 1 |


  Scenario Outline: Cannot update the boolean of the param of "enable_incoming_emails" of project with strange values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "enable_incoming_emails": <Boolean>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "'enable_incoming_emails' must be a non-string boolean true or false value"
    Examples:
    |Boolean|
    | "true" |
    | 1 |


  Scenario Outline: Cannot update the parameter of "project_type" of project with strange values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	    "project_type": <parameter>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "'project_type' must be one of: demo, private, public, shared"
    Examples:
    |parameter|
    |"privates" |
    |"1" |
    |true |


  Scenario Outline: Cannot update the Week start day with Start_date in the project with wrong values
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
        "week_start_day":"<day>",
        "start_date" : "<date>"
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I verify the general_problem of error is: "<message>"
    Examples:
    |day|date|message|
    |Sunday|2019-04-20 |4/20/2019 is a Saturday and Iterations in this project start on Sundays.|
    |SUNDAY|21-04-2019 |'start_date' must be a date value represented as iso 8601 date          |


  Scenario: Cannot set a "Time Zone" in a project with non-existent time zone
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
	     "time_zone": {
             "olson_name": "Europe/La_Paz",
             "offset": "-04:00"
	     }
      }
      """
    When I send the request
    Then I get a "400" status code as response
