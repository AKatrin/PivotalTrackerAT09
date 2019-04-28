@functional_get_negative @stories
Feature: Functional test Positive cases of stories for read

  @create_stories
  Scenario: Read the content of stories with story id as parameter
    Given I set up a "GET" request to "/projects/{story_id}/stories" endpoint
    When I send the request
    Then I get a "404" status code as response
    And I should see a messages error: The object you tried to access could not be found.  It may have been removed by another user, you may be using the ID of another object type, or you may be trying to access a sub-resource at the wrong point in a tree.

