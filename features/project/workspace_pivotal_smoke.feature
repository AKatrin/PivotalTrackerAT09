@smoke
  Feature: Create CRUD for Workspace

    Scenario: Get all the Workspaces
      Given   I set up a "GET" request to "/my/workspaces" endpoint
      When    I send the request
      Then    I get a "200" status code as response

    @create_project
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

#      Scenario: Create a new Workspace
#      Given   I set up a "POST" request to "/my/workspaces" endpoint
#      And     I set up the data:
#       """
#        {
#          "name":"A new workspace16",
#          "project_ids":[{project_id}]
#        }
#       """
#      When    I send the request
#Then I get a "200" status code as response