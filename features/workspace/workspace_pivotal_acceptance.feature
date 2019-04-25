@acceptance
  Feature: Create "Acceptance" test CRUD's(Create, Read, Update and Delete) for Workspace

    @create_project @create_workspace @delete_project @delete_workspace
    Scenario: Get all the Workspaces
      Given   I set up a "GET" request to "/my/workspaces" endpoint
      When    I send the request
      Then    I get a "200" status code as response
      And     I verify all workspace schema


