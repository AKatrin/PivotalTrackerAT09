from behave import *
from compare import *

import json

from core.logger.singleton_logger import SingletonLogger
from core.rest_client.request_manager import *
from core.utils.json_helper import JsonHelper

logger = SingletonLogger().get_logger()


@given('I set up a "{method}" request with id to "{endpoint}" endpoint')
def step_impl(context, method, endpoint):
    logger.info("Make the call")
    client = RequestManager()
    client.set_method(method)
    client.set_endpoint(endpoint + str(context.id))
    context.client = client
