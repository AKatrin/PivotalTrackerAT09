@functional_positive
Feature: Functional Test Positive Cases of Create, Read, Update and Delete Projects

  @create_project @delete_project
  Scenario Outline: Update the name of project with 50 characters in name
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
        "name":"This is an example of a name of project in pivotal"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I verify the schema of project
    And Sent Data should contain the same info, <field> and '<content>'
    And I get the same json and compare with the modified json
    Examples:
      |field|content|
      |name |This is an example of a name of project in pivotal|