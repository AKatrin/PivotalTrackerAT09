from behave import *
from compare import *

import jsonschema

from core.utils.json_helper import JsonHelper
from core.utils.util import *
from core.utils.repository import Repository
from core.utils.project_helper import *


logger = SingletonLogger().get_logger()

@step(u'I set up a "{method}" request to "{endpoint}" endpoint')
def step_impl(context, method, endpoint):
    logger.info("Make the call")
    client = RequestManager()
    client.set_method(method)
    endpoint = Utils.check_endpoint(endpoint, context.ids)
    client.set_endpoint(endpoint)
    context.client = client
    print(endpoint)

@then(u'I get a "{status_code}" status code as response')
def step_impl(context, status_code):
    logger.info("Validation Status Code")
    if context.response.status_code is not 204:
        JsonHelper.print_pretty_json(context.response.json())
    expect(int(status_code)).to_equal(context.response.status_code)


@step(u'I set up a retrieve of all Projects')
def step_impl(context):
    logger.info("Make the call: ")
    client = RequestManager()
    client.set_method('GET')
    client.set_endpoint('/projects.json')
    context.client = client


@then(u'I get an OK response')
def step_impl(context):
    logger.info("Validation Smoke")
    JsonHelper.print_pretty_json(context.response.json())
    expect(200).to_equal(context.response.status_code)


@step(u'I send the request')
def step_impl(context):
    logger.info("Execute request")
    context.response = context.client.execute_request()


@step(u'I set up the data')
def step_impl(context):
    logger.info("Add Data to request")
    if "{epic_id}" in context.text:
        context.text = context.text.replace("{epic_id}", str(context.ids["{epic_id}"]))
    body = json.loads(context.text)
    context.client.set_body(json.dumps(body))


@step("I verify all projects schema")
def step_impl(context):
    logger.info("Verify all the projects with schema")
    errors = Project_Helper.compare_all_schema(context.response.json())
    expect([]).to_equal(errors)


@step("Sent Data should contain the same info, name:'{name}'")
def step_impl(context, name):
    logger.info("Sent Data should contain the same info")
    expect(name).to_equal(context.response.json()["name"])


@step("I verify the schema of project")
def step_impl(context):
    logger.info("Verify the schema of project")
    errors = Project_Helper.compare_schema(context.response.json())
    expect([]).to_equal(errors)


@step(u'I get the Epic Id created')
def step_imp(context):
    logger.info('Get Epic Id created')
    Repository.get_instance().epic_id = context.response.json()['id']
    context.ids["{epic_id}"] = context.response.json()['id']


@given("I count all the projects which exist in a account")
def step_impl(context):
    context.length_project = len(Project_Helper.get_all_projects())


@step("The length of projects is reduced by one")
def step_impl(context):
    actual = len(Project_Helper.get_all_projects())
    expect(context.length_project - 1).to_equal(actual)


@step(u'I validated the epic schema')
def step_impl(context):
    logger.info("Validate the epic schema")
    with open(Repository.get_instance().EPIC_SCHEMA, "r") as read_file:
        data = json.load(read_file)
    jsonschema.validate(context.response.json(), data)


# @given('I set up a {method} request to {endpoint} endpoint with parameters')
# def step_impl(context, method, endpoint):
#     logger.info("Validate the parameters")
#     client = RequestManager()
#     client.set_method(method)
#     if "?" in endpoint:
#         client.set_parameters()
#     endpoint = Utils.check_endpoint(endpoint, context.ids)
#     client.set_endpoint(endpoint)
#     context.client = client