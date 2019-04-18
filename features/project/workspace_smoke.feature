@smoke
  Feature: Create CRUD for workspaces
    Scenario: Get all workspaces
      Given   I set up a "GET" request to "/my/workspaces" endpoint
      When    I send the request
      Then    I get a "200" status code as response

    Scenario: Create a new Workspace
      Given   I set up a "POST" request to "/my/workspaces" endpoint
      And I set up the data:
      """
      {
        "name":"A new workspace4",
        "project_ids":[{project_id}]
      }
      """
    When I send the request
    Then I get a "200" status code as response
