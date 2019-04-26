from behave import *
from compare import *


import jsonschema

#from core.utils.epic_helper import EpicHelper
from core.utils.epic_helper import EpicHelper
from core.utils.json_helper import JsonHelper
from core.utils.project_helper import *
from core.utils.repository import Repository
from core.utils.schema_helper import *
from core.utils.util import *
from core.utils.project_helper import *
from core.utils.schema_helper import *

import jsonschema

logger = SingletonLogger().get_logger()


@step(u'I set up a "{method}" request to "{endpoint}" endpoint')
def step_impl(context, method, endpoint):
    logger.info("Make the call")
    client = RequestManager()
    client.set_method(method)
    endpoint = Utils.check_endpoint(endpoint, context.ids)
    client.set_endpoint(endpoint)
    context.client = client


@step('I configure the "{field}" with the values "{values}"')
def step_impl(context, field, values):
    context.client.set_parameters({field: values})


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
    print(context.response.url)


@step(u'I set up the data')
def step_impl(context):
    logger.info("Add Data to request")
    if "{epic_id}" in context.text:
        context.text = context.text.replace("{epic_id}", str(context.ids["{epic_id}"]))
    elif "{long_name_epic}" in context.text:
        context.text = context.text.replace("{long_name_epic}", EpicHelper.long_string(5000))
    elif "{long}" in context.text:
        context.text = context.text.replace("{long}", EpicHelper.long_string(20000))
    elif "{more_long}" in context.text:
        context.text = context.text.replace("{more_long}", EpicHelper.long_string(20001))
    elif "{long_label_name}" in context.text:
        context.text = context.text.replace("{long_label_name}", EpicHelper.long_string(256))
    elif "{new_project_ids}" in context.text:
        context.text = context.text.replace("{new_project_ids}", str(context.ids.get("{proj_id}")))
    elif "{update_project_ids}" in context.text:
        print("contest in update:", context.projects[0].get("id"))
        context.text = context.text.replace("{update_project_ids}", str(context.projects[0].get("id")))
    elif "{min_velocity_averaged_over}" in context.text:
        context.text = context.text.replace("{min_velocity_averaged_over}",
                                            str(context.project['velocity_averaged_over']))
    context.body = json.loads(context.text)
    context.client.set_body(json.dumps(context.body))


@step("I verify all {schema} schema")
def step_impl(context, schema):
    logger.info("Verify all schema of " + schema + " list")
    errors = Schema_Helper.compare_all_schema(context.response.json(), schema)
    expect([]).to_equal(errors)


@step("Sent Data should contain the same info, {field} and '{content}'")
def step_impl(context, field, content):
    logger.info("Sent Data should contain the same info")
    if content.find("{") > -1:
        content = context.ids[content]
    expect(content).to_equal(context.response.json()[field])


@step("I verify the {schema} schema")
def step_impl(context, schema):
    logger.info("Verify the schema of " + schema)
    errors = Schema_Helper.compare_schema(context.response.json(), schema)
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


@step(u'I compare de epic name')
def step_imp(context):
    logger.info("verify the epic name")
    expect("Test Epic").to_equal(context.response.json()["name"])


@step(u'I compare the {request_response} message')
def step_imp(context, request_response):
    logger.info("verify the error message")
    if request_response == 'label error':
        expect("The label 'project epic' is already used by another epic.").to_equal(context.response.json()["general_problem"])
    elif request_response == 'invalid error':
         expect("One or more request parameters was missing or invalid.").to_equal(context.response.json()["error"])
    elif request_response == 'name':
         expect("      hola").to_equal(context.response.json()["label: name"])


@step("I get the same json and compare with the modified json")
def step_impl(context):
    json_actual = JsonHelper.get_json("project", context.ids)
    compare = JsonHelper.compare_json_against_json(context.response.json(), json_actual)
    expect({}).to_equal(compare)


@step("Sent Data should be the same info of the respond")
def step_impl(context):
    result = JsonHelper.compare_data_against_json(context.body, context.response.json())
    expect({}).to_equal(result)


@step('The {name_id} should be the same id of data')
def step_impl(context, name_id):
    logger.info("Id sent should be the same response's id")
    expect(context.ids[name_id]).to_equal(context.response.json()["id"])


@step("I should see a messages error: {message}")
def step_impl(context, message):
    logger.info("Validate the error message")
    if message in context.response.json()["error"]:
        expect(message).to_be_truthy()
    else:
        expect(message).to_be_falsy()


@step("I should see a message error: {invalid}")
def step_impl(context, invalid):
    logger.info("Validate the error message")
    text = context.response.json()["general_problem"]
    if invalid in context.response.json()["general_problem"]:
        expect(invalid).to_be_truthy()
    else:
        expect(invalid).to_be_falsy()
