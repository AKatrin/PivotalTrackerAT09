@negative @workspace
  Feature: Negative test of "workspace". Create and Update a workspace.

    @create_project @delete_project
    Scenario Outline: Create a new workspace with invalid name
      Given   I set up a "POST" request to "/my/workspaces" endpoint
      And     I set up the data:
      """
      {
        "name": "<invalid_name>",
        "project_ids": [{new_project_ids}]
      }
      """
      When    I send the request
      Then    I get a "400" status code as response
      And     I should see a messages error: One or more request parameters was missing or invalid.

    Examples: Invalid name workspace
      |invalid_name|
      |null        |
      |Workspace with name big not accept|


    @create_project @create_workspace @delete_project
    Scenario Outline: Update a workspace with invalid id project
      Given   I set up a "PUT" request to "/my/workspaces/{workspace_id}" endpoint
      And     I set up the data:
      """
      {
        "project_ids": [<project_ids>]
      }
      """
      When    I send the request
      Then    I get a "400" status code as response
      And     I should see a messages error: One or more request parameters was missing or invalid.

    Examples: Invalid ids project
      |project_ids|
      |0          |
      |"String as id"|

