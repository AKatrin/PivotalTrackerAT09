@functional_put_negative

Feature: Functional test Negative cases of stories for update
  @create_stories_in_project @delete_project
  Scenario: Update the name a storie of a projet with the name is empty
    Given I set up a "PUT" request to "/projects/{proj_id}/stories/{stories_id}" endpoint
    And I set up the data:
      """
        {
          "name": " "
        }
      """
    When I send the request
    Then I get a "400" status code as response
    And I should see a messages error: One or more request parameters was missing or invalid.
    And I Should see the problem: Name can't be blank

  @create_stories_in_project @delete_project
  Scenario: Update the name a storie of a projet with the name is null
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
          "name": null
        }
      """
    When I send the request
    Then I get a "400" status code as response
    And I should see a messages error: One or more request parameters was missing or invalid.
    And I Should see the problem: Name can't be blank