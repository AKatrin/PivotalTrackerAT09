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
    And I verify the project schema is not modified
    And I verify the data of project json is not changed
    Examples:
    |name|
    |1|
    |" "|
    |{"name":"another name"}|
    |["name", "name2"]|
    |"This is an example of a name of project in pivotal."|
    | null|


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
    And I verify the project schema is not modified
    And I verify the data of project json is not changed



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
    And I verify the project schema is not modified
    And I verify the data of project json is not changed
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
    And I verify the project schema is not modified
    And I verify the data of project json is not changed
    Examples:
      |values|
      |"-1"|
      |"0,5,10,8,20"|
      |"100,101,103,104,105,106,107,108,109,110,111,112,113"|
      |"[1,2]"|
      |"1,2,2,3"|
      |"5,4,3,2,1"|
      |true|
      |"word,0,1"|
      |null|


