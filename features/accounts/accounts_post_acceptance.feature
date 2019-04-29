# Created by Areliez at 4/25/2019
@acceptance @account
Feature: Acceptance tests to create account membership

  @create_account
  Scenario: Create a membership for an account
    Given I set up a "POST" request to "/accounts/{id}/memberships" endpoint
    And I set up the data
    """
    {
      "email":"{email}",
      "initials":"{initials}",
      "name":"{name}"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the account_membership schema


   @get_second_account
   Scenario: Create a membership for an account sending the person id.
    Given I set up a "POST" request to "/accounts/{id}/memberships" endpoint
    And I set up the data
    """
    {
      "person_id": {person_id}
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the account_membership schema
