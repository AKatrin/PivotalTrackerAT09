# Created by Areliez at 4/17/2019
@account
Feature: Smoke tests to read accounts

  @smoke
  Scenario: Read the accounts
    Given I set up a "GET" request to "/accounts" endpoint
    When I send the request
    Then I get a "200" status code as response


  @smoke
  Scenario: Read a account summaries
    Given I set up a "GET" request to "/account_summaries" endpoint
    When I send the request
    Then I get a "200" status code as response


  @smoke @create_account
  Scenario: Read a account by id
    Given I set up a "GET" request to "/accounts/{id}" endpoint
    When I send the request
    Then I get a "200" status code as response


  @smoke @create_account_memberships
  Scenario: Read account membership
    Given I set up a "GET" request to "/accounts/{id}/memberships" endpoint
    When I send the request
    Then I get a "200" status code as response
