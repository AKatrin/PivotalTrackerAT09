from behave import *
from compare import *

from core.utils.json_helper import JsonHelper
from core.utils.util import *
from core.utils.endpoint_helper import EndpointHelper
from core.utils.repository import Repository
from core.utils.project_helper import *

logger = SingletonLogger().get_logger()


@step(u'I set up a "{method}" request to "{endpoint}" endpoint')
def step_impl(context, method, endpoint):
    logger.info("Make the call")
    client = RequestManager()
    client.set_method(method)

    if "{epic_id}" in endpoint:
        endpoint = EndpointHelper.translate_endpoint(endpoint)
    endpoint = Utils.check_endpoint(endpoint, context.ids)
    client.set_endpoint(endpoint)
    context.client = client


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


@given("I count all the projects which exist in a account")
def step_impl(context):
    """
    :type context: behave.runner.Context
    """
    raise NotImplementedError(u'STEP: Given I count all the projects which exist in a account')

@step(u'I get the Epic Id created')
def step_imp(context):
    logger.info('Get Epic Id created')
    print("REsponse iD epic: ",context.response.json()['id'])
    Repository.get_instance().epic_id = context.response.json()['id']
