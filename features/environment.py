
from core.logger.singleton_logger import SingletonLogger
from core.rest_client.request_manager import *

logger = SingletonLogger().get_logger()


def before_scenario(context, scenario):
    if "get_id_account" in scenario.tags:
        logger.info("Get the id of the account")
        client = RequestManager()
        client.set_method('GET')
        client.set_endpoint('/accounts')
        response = client.execute_request()
        context.id_account = response.json()[0]['id']


def after_scenario(context, scenario):
    if 'delete_project' in scenario.tags:
        logger.info("Get the id of the account")
        client = RequestManager()
        client.set_method('DELETE')
        client.set_endpoint('/projects')
        response = client.execute_request()