# Created by Areliez at 4/23/2019
@acceptance
Feature: Get accounts

  @create_account
  Scenario: Get a account by id
    Given I set up a "GET" request to "/accounts/{id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify the account schema
    And The {id} should be the same id of data


  Scenario: Get the accounts
    Given I set up a "GET" request to "/accounts" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify all account schema


  Scenario: Get a account summaries
    Given I set up a "GET" request to "/account_summaries" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify all account_summaries schema


  @smoke @create_account_memberships
  Scenario: Get account membership
    Given I set up a "GET" request to "/accounts/{id}/memberships" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify all account_membership schema
