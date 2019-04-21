# Created by Areliez at 4/17/2019
Feature: Get accounts

  @smoke
  Scenario: Get the accounts
    Given I set up a "GET" request to "/accounts" endpoint
    When I send the request
    Then I get a "200" status code as response


  @smoke
  Scenario: Get a account summaries
    Given I set up a "GET" request to "/account_summaries" endpoint
    When I send the request
    Then I get a "200" status code as response


  @smoke @create_account
  Scenario: Get a account by id
    Given I set up a "GET" request to "/accounts/{id}" endpoint
    When I send the request
    Then I get a "200" status code as response


  @smoke @create_account_memberships
  Scenario: Get account membership
    Given I set up a "GET" request to "/accounts/{id}/memberships" endpoint
    When I send the request
    Then I get a "200" status code as response