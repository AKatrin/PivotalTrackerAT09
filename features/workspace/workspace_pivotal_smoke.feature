@smoke @workspace
  Feature: Create "Smoke" test CRUD's(Create, Read, Update and Delete) for Workspace

    @create_project @create_workspace @delete_project @delete_workspace
    Scenario: Get all the Workspaces
      Given   I set up a "GET" request to "/my/workspaces" endpoint
      When    I send the request
      Then    I get a "200" status code as response

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

    @create_project @create_workspace @delete_project @delete_workspace
    Scenario: Get a workspace by id
      Given   I set up a "GET" request to "/my/workspaces/{workspace_id}" endpoint
      When    I send the request
      Then    I get a "200" status code as response

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

    @create_project @create_workspace @delete_project @delete_workspace
    Scenario: Delete a Workspace
      Given   I set up a "DELETE" request to "/my/workspaces/{workspace_id}" endpoint
      When    I send the request
      Then    I get a "204" status code as response

    @create_project @create_stories @create_workspace @delete_project @delete_workspace
    Scenario: Get activities from a Workspace
      Given   I set up a "GET" request to "/workspaces/{workspace_id}/activity" endpoint
      When    I send the request
      Then    I get a "200" status code as response