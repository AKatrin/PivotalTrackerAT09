from behave import *
from compare import *

import json

from core.logger.singleton_logger import SingletonLogger
from core.rest_client.request_manager import *
from core.utils.json_helper import JsonHelper
from core.utils.util import *
logger = SingletonLogger().get_logger()


@step(u'I set up a "{method}" request to "{endpoint}" endpoint')
def step_impl(context, method, endpoint):
    logger.info("Make the call")
    client = RequestManager()
    client.set_method(method)
    # endpoint = Utils.check_endpoint(endpoint, context.id)
    # client.set_endpoint(endpoint)
    if "{id}" in endpoint:
        client.set_endpoint(endpoint.format(id=context.id))
    elif "{proj_id}" in endpoint:
        client.set_endpoint(endpoint.format(proj_id=context.id))
    else:
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
