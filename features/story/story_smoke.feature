@smoke
  Feature: Create crud for Stories of a project

  @create_stories_project @delete_project
  Scenario: Get Stories of a project
    Given I set up a "GET" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    When I send the request
    Then I get a "200" status code as response


  @create_stories_project @delete_project
  Scenario: Get Stories of a project
    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    And I set up the data:
    """
      {"labels":["no life signs","look sir metal"]}
    """
    When I send the request
    Then I get a "200" status code as response
#{"id": {id_old_stories}}]}

  @create_stories_project @delete_project
  Scenario: Delete Stories by Id
    Given I set up a "DELETE" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    When I send the request
    Then I get a "204" status code as response


  #funciona
  @create_stories_project @delete_project
  Scenario: Get Stories of a project
    Given I set up a "POST" request to "/projects/{proj_id}/stories/{stories_id}/owners" endpoint
    And I set up the data:
    """
      {"id":{account_id}}
    """
    When I send the request
    Then I get a "200" status code as response


  @create_stories_project @delete_project
  Scenario: Get Stories of a project
    Given I set up a "GET" request to "/projects/{proj_id}/stories/{stories_id}/owners" endpoint
    When I send the request
    Then I get a "200" status code as response
































#{"id":{account_id}}

#  @create_stories_project @delete_project
#  Scenario: Get Stories of a project
#    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
#    And I set up the data:
#    """
#      {"before_id":{story_id},"current_state":"started","estimate":1}
#    """
#    When I send the request
#    Then I get a "200" status code as response


#  @create_stories_project @delete_project
#  Scenario: Get Stories of a project
#    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
#    And I set up the data:
#    """
#      {"before_id":{story_before_id},"current_state":"started","estimate":1}
#    """
#    When I send the request
#    Then I get a "200" status code as response


#  @create_stories_project_ids @delete_project
#  Scenario: Get Stories of a project
#    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
#    And I set up the data:
#    """
#      {"after_id":{story_after_id},"before_id":null,"group":"scheduled","project_id":98}
#    """
#    When I send the request
#    Then I get a "200" status code as response