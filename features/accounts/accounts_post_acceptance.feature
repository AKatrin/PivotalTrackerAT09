# Created by Areliez at 4/25/2019
Feature: Create a membership

  @create_account
  Scenario: Create a membership for a account
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
