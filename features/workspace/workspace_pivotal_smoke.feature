@smoke @workspace
  Feature: Create CRUD for Workspace

    Scenario: Get all the Workspaces
      Given   I set up a "GET" request to "/my/workspaces" endpoint
      When    I send the request
      Then    I get a "200" status code as response

    @create_project @delete_workspace
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

    @create_project @create_workspace @delete_workspace
    Scenario: Get a workspace by id
      Given   I set up a "GET" request to "/my/workspaces/{workspace_id}" endpoint
      When    I send the request
      Then    I get a "200" status code as response

    @create_project @create_workspace @delete_workspace
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