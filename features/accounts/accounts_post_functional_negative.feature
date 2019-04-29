# Created by Areliez at 4/28/2019
@functional_post_negative  @account
Feature: Functional test cases Negative to create account membership

  @get_id_first_account
  Scenario: Create a membership sending an existing email in account.
    Given I set up a "POST" request to "/accounts/{id}/memberships" endpoint
    And I set up the data
    """
    {
      "email":"areliez.vargas@fundacion-jala.org"
    }

    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a messages error: One or more request parameters was missing or invalid.
    And I Should see the problem: Member already exists.


  @get_id_first_account
  Scenario: Create a membership sending an existing person id in account.
    Given I set up a "POST" request to "/accounts/{id}/memberships" endpoint
    And I set up the data
    """
    {
      "person_id": {person_id}
    }

    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a messages error: One or more request parameters was missing or invalid.
    And I Should see the problem: Member already exists.

  @get_person_id
  Scenario Outline: Create a membership in account id that doesn't exist.
    Given I set up a "POST" request to "/accounts/{<id>}/memberships" endpoint
    And I set up the data
    """
    {
      "person_id": "{person_id}"
    }

    """
    When I send the request
    Then I get a "404" status code as response
    And I should see a messages error: The object you tried to access could not be found.
    Examples:
      | id |
      | 0  |


   @get_id_first_account
   Scenario Outline: Create a membership invalid account id.
    Given I set up a "POST" request to "/accounts/{<id>}/memberships" endpoint
    And I set up the data
    """
    {
      "person_id": "{person_id}"
    }

    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a messages error: The path you requested has no valid endpoint.
    Examples:
      | id |
      | string |
      | 23.4   |
      |        |


  @get_id_first_account
  Scenario Outline: Create a membership sending invalid person id.
    Given I set up a "POST" request to "/accounts/{id}/memberships" endpoint
    And I set up the data
    """
    {
      "person_id": <person_id>
    }

    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a messages error: One or more request parameters was missing or invalid.
    And I Should see the problem: 'person_id' must be an integer value
    Examples:
      | person_id |
      | "string " |
      | null      |
      | true      |
      | 234.5     |


  @get_id_first_account
  Scenario: Create a membership without to send the body.
    Given I set up a "POST" request to "/accounts/{id}/memberships" endpoint
    When I send the request
    Then I get a "400" status code as response
    And I should see a messages error: One or more request parameters was missing or invalid.
    And I Should see the problem: this endpoint requires at least one of the following parameters: admin, created_at, email, initials, name, person_id, project_creator, time_enterer, timekeepe


  @create_account
  Scenario Outline: Create a membership for a account sending an invalid email.
    Given I set up a "POST" request to "/accounts/{id}/memberships" endpoint
    And I set up the data
    """
    {
      "email":"<email>",
      "initials":"AT",
      "name":"Automation Test"
    }

    """
    When I send the request
    Then I get a "400" status code as response
    And I should see a messages error: One or more request parameters was missing or invalid.
    And I Should see the requirement: <email> is not a valid email address.
    And I Should see the problem: One or more consistency checks failed on the supplied Person.
    Examples:
      | email |
      | dooku|
      | dooku e@dominio.dom |
      | doo%u#e@dominio.dom |
      | dookue@do.1 |
      | dookue@do.c |
      | 4dookue@do.dom |
