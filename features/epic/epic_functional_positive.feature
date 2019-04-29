@positive
Feature: Functional Testing Positive  for Epic and Epics for Post and Put

  @create_project @delete_project
  Scenario:Create a new Epic with long name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name" : "{long_name_epic}"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the response
    And I get the same epic json and compare with the modified json


  @create_project @delete_project
  Scenario: Create a new Epic with short name
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "name" : "x"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the response
    And I get the same epic json and compare with the modified json

  @create_epic  @delete_project
  Scenario: Update label with special characters and doubles quotes label name Epic
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
     "description":"{long}",
     "name" : "!#$\"%&/()=?¡¨*{}:;_<}{+[]"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the response
    And I get the same epic json and compare with the modified json


  @create_epic @delete_project
  Scenario: Create a new Epic with double quote name label related to after Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "after_id":{epic_id},
      "label": {
                  "name": "ho\"a"
               },
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And Sent Data should be the same info of the respond for name


  @create_epic @delete_project
  Scenario: Create a new Epic with double quote name label related to before Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "before_id":{epic_id},
      "label": {
                  "name": "ho\"a"
               },
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And Sent Data should be the same info of the respond for name

  @create_project @delete_project
  Scenario: Create a new Epic with name and long description.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"{long}",
    "name":"Tractor Beams"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the response
    And I get the same epic json and compare with the modified json


  @create_project @delete_project
  Scenario: Create a new Epic with url name and short description.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"x",
    "name":"/usr/local/tomcat/logs/CofaxTools.log"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the response
    And I get the same epic json and compare with the modified json


  @create_project @delete_project
  Scenario: Create a new Epic with abbrev name and empty description.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description": "",
    "name":"ISO 8879:1986"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond for name
    And I get the same epic json and compare with the modified json


  @create_project @delete_project
  Scenario: Create a new Epic with long description, long name and long label.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"{long}",
    "label":{
              "name":"{long_label_name}"
            },
    "name":"{long_name_epic}"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond for name
    And Sent Data should be the same info of the respond for description
    And I get the same epic json and compare with the modified json


  @create_epic @delete_project
  Scenario: Create a new Epic with different label related to after Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "after_id":{epic_id},
      "label": {
                  "name": "Project Epic1"
               },
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And Sent Data should be the same info of the respond for name


  @create_epic @delete_project
  Scenario: Create a new Epic with the same name of another Epic related to after Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "after_id":{epic_id},
      "label": {
                  "name": "Project Epic1"
               },
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And Sent Data should be the same info of the respond for name


  @create_epic @delete_project
  Scenario: Create a new Epic with the special characters label name of another Epic related to after Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "after_id":{epic_id},
      "label": {
                  "name": "!#$%&/()=?¡¨*{}[];:_><"
               },
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And Sent Data should be the same info of the respond for name


  @create_epic @delete_project
  Scenario: Create a new Epic with different label related to before Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "before_id":{epic_id},
      "label": {
                  "name": "Project Epic1"
               },
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And Sent Data should be the same info of the respond for name


  @create_epic @delete_project
  Scenario: Create a new Epic with the same name of another Epic related to before Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "before_id":{epic_id},
      "label": {
                  "name": "Project Epic1"
               },
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And Sent Data should be the same info of the respond for name


  @create_epic @delete_project
  Scenario: Create a new Epic with different label related to before Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "before_id":{epic_id},
      "label": {
                  "name": "!#$%&/();:´+{}[]"
               },
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And Sent Data should be the same info of the respond for name


  @create_epic @delete_project
  Scenario: Create a new Epic with double quote in the name  related to after Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "after_id":{epic_id},
      "label": {
                  "name": "label"
               },
      "name":"Project \" Epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And Sent Data should be the same info of the respond for name

  @create_epic @delete_project
  Scenario: Create a new Epic with double quote in the name related to before Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "before_id":{epic_id},
      "label": {
                  "name": "label"
               },
      "name":"Project\" Epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And Sent Data should be the same info of the respond for name


  @create_project @delete_project
  Scenario: Create a new Epic with name, long comments
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "comments":[{
                     "text":"{long}"
                  }],
      "name":"PR"
    }
    """
    When I send the request
    And I get the Epic Id created
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond for name
    And I get the same epic json and compare with the modified json


  @create_epic  @delete_project
  Scenario: Update Epic long name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
     "name" : "{long_name_epic}"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the response
    And I get the same epic json and compare with the modified json


  @create_epic  @delete_project
  Scenario: Update Epic short name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
     "name" : "x"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the response
    And I get the same epic json and compare with the modified json


  @create_epic  @delete_project
  Scenario: Update Epic long description
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
       "description":"{long}"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the response
    And I get the same epic json and compare with the modified json


  @create_epic  @delete_project
  Scenario: Update Epic short description
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
       "description":"x"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the response
    And I get the same epic json and compare with the modified json


  @create_epic  @delete_project
  Scenario: Update Epic empty description
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
       "description":"",
       "name": "Project Epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond for name
    And I get the same epic json and compare with the modified json


  @create_epic  @delete_project
  Scenario: Update Epic long description, long name label and long name epic
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
     "description":"{long}",
     "label":{
              "name":"{long_label_name}"
            },
     "name" : "{long_name_epic}"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond for description
    And Sent Data should be the same info of the respond for name
    And I get the same epic json and compare with the modified json


 @create_epic  @delete_project
  Scenario: Update label to a short name Epic
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
     "description":"{long}",
     "label":{
              "name":"x"
            },
     "name" : "Project Epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond for description
    And Sent Data should be the same info of the respond for name
    And I get the same epic json and compare with the modified json


@create_epic  @delete_project
  Scenario: Update label with special characters label name and name Epic
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
     "description":"{long}",
     "label":{
              "name":"!#$%&/()=?¡¨*{}:;_><}{+[]"
            },
     "name" : "!#$%&/()=?¡¨*{}:;_><}{+[]"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the epic schema
    And Sent Data should be the same info of the respond for description
    And Sent Data should be the same info of the respond for name
    And I get the same epic json and compare with the modified json


  @create_epic @delete_project
  Scenario: Update an Epic with the null label name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
     "label": {
                  "name": null
               },
      "name" : "Project Epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And Sent Data should be the same info of the respond for name
    And I get the same epic json and compare with the modified json