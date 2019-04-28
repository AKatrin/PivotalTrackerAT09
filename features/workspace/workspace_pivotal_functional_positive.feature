@positive @workspace
  Feature: Positive test of "workspace". Create and Update a workspace.

    @create_project @delete_project @delete_workspace
    Scenario Outline: Create a new workspace with valid name
      Given I set up a "POST" request to "/my/workspaces" endpoint
      And   I set up the data:
      """
      {
        "name":"<name_workspace>",
        "project_ids":[{new_project_ids}]
      }
      """
      When  I send the request
      Then  I get a "200" status code as response
      And   I verify the workspace schema
      And   Sent Data should be the same info of the respond

    Examples: workspace names
    |name_workspace          |
    |w                       |
    |Workspace with big name.|


    @create_project @create_workspace @delete_project @delete_workspace
    Scenario Outline: Update a workspace
      Given I set up a "PUT" request to "/my/workspaces/{workspace_id}" endpoint
      And   I set up the data:
      """
      {
        "project_ids": [<project_ids>]
      }
      """
      When  I send the request
      Then  I get a "200" status code as response
      And   Sent Data should contain the same info, id and '{workspace_id}'
      And   Sent Data should be the same info of the respond

    Examples: Project ids
      |project_ids      |
      |2334401         |
      |2334401, 2334403|

