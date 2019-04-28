@acceptance
  Feature: Acceptance tests for stories of a project with read, update and delete

  @create_stories_project @delete_project
  Scenario: Get Stories of a project with the id of the storie
    Given I set up a "GET" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify the story schema


  @create_stories_project_by_id @delete_project
  Scenario: Update the labels of the Stories of a project
    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    And I set up the data:
    """
      {"labels":[{"name":"newnew"},{"name":"labellabel"},{"id":{story_id}}]}
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the story schema
    And Sent Data should be the same info of the respond story


  @create_stories_project @delete_project
  Scenario: Update the labels of a storie of a project
    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    And I set up the data:
    """
      {"labels":["no life signs","look sir metal"]}
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the story schema
    And Sent Data should be the same info of the respond story


  @create_stories_project @delete_project
  Scenario: Update the labels of a storie of a project
    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    And I set up the data:
    """
      {"labels":[]}
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the story schema
    And Sent Data should be the same info of the respond story


  @create_stories_project @delete_project
  Scenario: Update a body of a storie of a project
    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    And I set up the data
    """
    {"current_state":"accepted","estimate":1,"name":"Exhaust ports have ray shielding 👹"}
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the story schema


  @create_stories_project @delete_project
  Scenario: Delete a specific stories of a project
    Given I count all the stories of a project which exist in a account
    Given I set up a "DELETE" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    When I send the request
    Then I get a "204" status code as response
    And The length of the stories of a project is reduced by one


  @create_stories_project @delete_project
  Scenario: Create a storie for a project with a owner
    Given I set up a "POST" request to "/projects/{proj_id}/stories/{stories_id}/owners" endpoint
    And I set up the data:
    """
      {"id":{account_id}}
    """
    When I send the request
    Then I get a "200" status code as response

  @create_stories_project_by_id @delete_project
  Scenario: Update a Storie of a project using a before_id
    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    And I set up the data:
    """
      {"before_id":{story_before_id},"current_state":"started","estimate":1}
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the story schema
    And I verify the story schema



