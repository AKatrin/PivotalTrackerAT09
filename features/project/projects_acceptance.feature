@acceptance
Feature: Acceptance test of Create, Read, Update and Delete Projects

  Scenario: Access a user's projects
    Given I set up a "GET" request to "/projects" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify all project schema


  @get_id_account
  Scenario: Access a user's projects with the same account_id
    Given I set up a "GET" request to "/projects?account_ids={proj_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify all project schema


  @delete_project
  Scenario: Create a new empty project
    Given I set up a "POST" request to "/projects" endpoint
    And I set up the data:
    """
      {
        "name":"Project Test"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond


  @create_project @delete_project
  Scenario: Read the content of a specific project
    Given I set up a "GET" request to "/projects/{proj_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should contain the same info, id and '{proj_id}'


  @create_project @delete_project
  Scenario: Update the specific project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
        "name":"Change Project Name"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the project schema
    And Sent Data should be the same info of the respond


  @create_project
  Scenario: Delete a specific project
    Given I count all the projects which exist in a account
    Given I set up a "DELETE" request to "/projects/{proj_id}" endpoint
    When I send the request
    Then I get a "204" status code as response
    And The length of projects is reduced by one
    And The project is not exist in the account
