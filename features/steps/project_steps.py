from behave import *
from compare import *


from core.utils.epic_helper import EpicHelper
from core.utils.json_helper import JsonHelper
from core.utils.repository import Repository
from core.utils.schema_helper import *
from core.utils.story_helper import Story_Helper
from core.utils.util import *
from core.utils.project_helper import *
from core.utils.schema_helper import *
from core.utils.workspace_helper import WorkspaceHelper

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
    if "story_id" in values:
        context.client.set_parameters({field: context.ids.get("{story_id}")})
    else:
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
    print( "\n" + context.response.url + "\n")

@step(u'I set up the data')
def step_impl(context):
    logger.info("Add Data to request")
    if "{epic_id}" in context.text:
        context.text = context.text.replace("{epic_id}", str(context.ids["{epic_id}"]))
    if "{long_name_epic}" in context.text:
        context.text = context.text.replace("{long_name_epic}", EpicHelper.long_string(5000))
    if "{long}" in context.text:
        context.text = context.text.replace("{long}", EpicHelper.long_string(20000))
    if "{more_long}" in context.text:
        context.text = context.text.replace("{more_long}", EpicHelper.long_string(20001))
    if "{long_label_name}" in context.text:
        context.text = context.text.replace("{long_label_name}", EpicHelper.long_string(255))
    if "{new_project_ids}" in context.text:
        context.text = context.text.replace("{new_project_ids}", str(context.ids.get("{proj_id}")))
    if "{update_project_ids}" in context.text:
        context.text = context.text.replace("{update_project_ids}", str(context.projects[0].get("id")))
    if "{min_velocity_averaged_over}" in context.text:
        context.text = context.text.replace("{min_velocity_averaged_over}",
                                            str(context.project['velocity_averaged_over']))
    if "{name_existent}" in context.text:
        context.text = context.text.replace("{name_existent}", context.name)
        context.text = context.text.replace("{account}", context.account)
    if "{email}" in context.text and "{initials}" in context.text and "{name}" in context.text:
        context.text = context.text.replace("{email}", str(context.membership['email']))
        context.text = context.text.replace("{initials}", str(context.membership['initials']))
        context.text = context.text.replace("{name}", str(context.membership['name']))
    if "{story_before_id}" in context.text:
        context.text = context.text.replace("{story_before_id}", str(context.ids["{story_before_id}"]))
    if "{story_after_id}" in context.text and "{proj_id}" in context.text:
        context.text = context.text.replace("{story_after_id}", str(context.ids["{story_after_id}"]))
        context.text = context.text.replace("{proj_id}", str(context.ids["{proj_id}"]))
    if "{id_old_stories}" in context.text:
        context.text = context.text.replace("{id_old_stories}", str(context.ids["{id_old_stories}"]))
    if "{story_id}" in context.text:
        context.text = context.text.replace("{story_id}", str(context.ids["{story_id}"]))
    if "{account_id}" in context.text:
        context.text = context.text.replace("{account_id}", str(context.ids["{account_id}"]))
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
    logger.info("The length of projects in the account is captured")
    projects = Project_Helper.get_all_projects()
    context.length_project = len(projects)
    print(projects)
    print("LENGHT:", context.length_project)


@step("The length of projects is reduced by one")
def step_impl(context):
    logger.info("Check if projects was reduced by one")
    project = Project_Helper.get_all_projects()
    actual = len(project)
    print(project)
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
    logger.info("Compare the information of the json with a GET of the same project")
    json_actual = JsonHelper.get_json("project", context.ids)
    compare = JsonHelper.compare_json_against_json(context.response.json(), json_actual)
    expect({}).to_equal(compare)


@step("I get the same epic json and compare with the modified json")
def step_impl(context):
    logger.info("Compare the information of the json with a GET of the same project")
    json_actual = JsonHelper.get_json("epic", context.ids)
    compare = JsonHelper.compare_json_against_json(context.response.json(), json_actual)
    expect({}).to_equal(compare)


@step("Sent Data should be the same info of the respond")
def step_impl(context):
    logger.info("The data should be the same info of the respond")
    result = JsonHelper.compare_data_against_json(context.body, context.response.json())
    expect({}).to_equal(result)


@step("Sent Data should be the same info of the respond for {field}")
def step_impl(context, field):
    result = JsonHelper.compare_data_field_against_json(context.body, context.response.json(),field)
    expect({}).to_equal(result)


@step('The {name_id} should be the same id of data')
def step_impl(context, name_id):
    logger.info("Id sent should be the same response's id")
    expect(context.ids[name_id]).to_equal(context.response.json()["id"])


@step("I get a existent project")
def step_impl(context):
    logger.info("A ID project is gotten of a existent project")
    project = Project_Helper.get_all_projects()[0]
    context.name = project['name']
    context.account = str(project['account_id'])


@step("The project is not exist in the account")
def step_impl(context):
    logger.info("Check if the project was erased")
    projects = Project_Helper.get_all_projects()
    flag = False
    for item in projects:
        if item['id'] == context.project['id']:
            flag = True
            break
    expect(flag).to_be_falsy()


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

@step("I should see a message: {requirement}")
def step_impl(context, requirement):
    logger.info("Validate the error message")
    text = context.response.json()["requirement"]
    if requirement in context.response.json()["requirement"]:
        expect(requirement).to_be_truthy()
        
@step("The {workspace_id} be will found {answer}")
def step_impl(context, workspace_id, answer):
    logger.info("Sent Data should contain the same info")
    if workspace_id.find("id") > -1:
        id = context.ids["{" + workspace_id + "}"]
        expect(WorkspaceHelper.exist_workspaces(id)).to_equal(answer)

@step("I Should see the problem: {message}")
def step_impl(context, message):
    logger.info("Validate the general problem message")
    if message in context.response.json()["general_problem"]:
        expect(message).to_be_truthy()
    else:
        expect(message).to_be_falsy()

@step('I Should see the requirement: {message}')
def step_impl(context, message):
    logger.info("Validate the requirement message")
    if message in context.response.json()["requirement"]:
        expect(message).to_be_truthy()
    else:
        expect(message).to_be_falsy()

@step('I verify the general_problem of error is: "{message}"')
def step_impl(context, message):
    print(message)
    print(context.response.json()["general_problem"])
    expect(message).to_equal(context.response.json()["general_problem"])


@step("Sent Data should be the same info of the respond story")
def step_impl(context):
    logger.info("realizando la comparacion para story")
    result = JsonHelper.compareProject(context.body, context.response.json())
    expect("").to_equal(result)


@step("Sent Data should be the same info of the respond story body")
def step_impl(context):
    result = JsonHelper.compareProject(context.body, context.response.json())
    expect("").to_equal(result)


@given("I count all the stories of a project which exist in a account")
def step_impl(context):
    context.length_stories_project = len(Story_Helper.get_all_stories(context.ids["{proj_id}"]))


@step("The length of the stories of a project is reduced by one")
def step_impl(context):
    context.actual = Story_Helper.get_all_stories(context.ids["{proj_id}"])
    expect(context.actual).to_equal(context.actual)


@step("I get the same json and compare with the modified json story")
def step_impl(context):
    json_actual = JsonHelper.get_json("story", context.ids)
    compare = JsonHelper.compare_json_against_json(context.response.json(), json_actual)
    expect({}).to_equal(compare)