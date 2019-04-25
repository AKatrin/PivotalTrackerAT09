@acceptance @workspace
  Feature: Create "Acceptance" test CRUD's(Create, Read, Update and Delete) for Workspace

    @create_project @create_workspace @delete_project @delete_workspace
    Scenario: Get all the Workspaces
      Given   I set up a "GET" request to "/my/workspaces" endpoint
      When    I send the request
      Then    I get a "200" status code as response
      And     I verify all workspace schema

    @create_project  @delete_project @delete_workspace
    Scenario: Create a new workspace
      Given   I set up a "POST" request to "/my/workspaces" endpoint
      And     I set up the data:
      """
        {
          "name":"I am a new Workspace",
          "project_ids":[{new_project_ids}]
        }
      """
      When    I send the request
      Then    I get a "200" status code as response
      And     I verify the workspace schema
      And     Sent Data should be the same info of the respond

    @create_project @create_workspace @delete_project @delete_workspace
    Scenario: Get a workspace by id
      Given   I set up a "GET" request to "/my/workspaces/{workspace_id}" endpoint
      When    I send the request
      Then    I get a "200" status code as response
      And     I verify the workspace schema
      And     Sent Data should contain the same info, id and '{workspace_id}'

    @create_project @create_workspace @delete_project @delete_workspace
    Scenario: Update a Workspace its project_ids
      Given   I set up a "PUT" request to "/my/workspaces/{workspace_id}" endpoint
      And     I set up the data:
      """
        {
          "project_ids":[{update_project_ids}]
        }
      """
      When    I send the request
      Then    I get a "200" status code as response
      And     I verify the workspace schema
      And     Sent Data should contain the same info, id and '{workspace_id}'
      And     Sent Data should be the same info of the respond
