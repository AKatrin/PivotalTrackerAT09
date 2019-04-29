# Created by Areliez at 4/24/2019
@functional_get_negative @account
Feature: Functional test cases negative of read for account by id

  Scenario Outline: Get account by id invalid
    Given I set up a "GET" request to "/accounts/{<id>}" endpoint
    When I send the request
    Then I get a "400" status code as response
    And I should see a messages error: The id isn't valid

    Examples:
      | id    |
      | null  |
      | abcd  |
      | 1a2s  |
      | 12$3  |
      | 12 3  |

  Scenario Outline: Get account by id that not exist
    Given I set up a "GET" request to "/accounts/{<id>}" endpoint
    When I send the request
    Then I get a "404" status code as response
    And I should see a messages error: The object you tried to access could not be found.
    Examples:
    |id|
    |0 |


  @get_id_account_of_other_user
  Scenario: Error try get an account by id of other user account
    Given I set up a "GET" request to "/accounts/{id}" endpoint
    When I send the request
    Then I get a "403" status code as response
    And I should see a messages error: Authorization failure.
