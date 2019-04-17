Feature: Get and Post Projects

  Scenario: Access a user's projects
    Given I set up a "GET" request to "/projects" endpoint
    When I send the request
    Then I get a "200" status code as response

  @get_id_account
  Scenario: Access a user's projects with the same account_id
    Given I set up a "GET" request with id to "/projects?account_ids=" endpoint
    When I send the request
    Then I get a "200" status code as response

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

  @create_project @delete_project
  Scenario: Access the content of a specific project
    Given I set up a "GET" request with id to "/projects/" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_project @delete_project
  Scenario: Update the specific project
    Given I set up a "PUT" request with id to "/projects/" endpoint
    And I set up the data:
    """
      {
        "name":"Change Project Name"
      }
      """
    When I send the request
    Then I get a "200" status code as response

  @create_project
  Scenario: Delete a specific project
    Given I set up a "DELETE" request with id to "/projects/" endpoint
    When I send the request
    Then I get a "204" status code as response
