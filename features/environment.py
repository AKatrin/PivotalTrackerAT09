import json

from core.logger.singleton_logger import SingletonLogger
from core.rest_client.request_manager import *
from core.utils.json_helper import JsonHelper

logger = SingletonLogger().get_logger()


def before_scenario(context, scenario):
    print("***************NEW SCENARIO******************")
    if "get_id_account" in scenario.tags:
        logger.info("Get the id of the account")
        client = RequestManager()
        client.set_method('GET')
        client.set_endpoint('/accounts')
        response = client.execute_request()
        context.id = response.json()[0]['id']
    elif 'create_project' in scenario.tags:
        logger.info("Create a project and get the id of the project")
        context.execute_steps('''
        Given I set up a "POST" request to "/projects" endpoint
        And I set up the data:
        """
        {
            "name":"Project Test"
        }
        """
        When I send the request
            ''')
        context.id = context.response.json()['id']


def after_scenario(context, scenario):
    if 'delete_project' in scenario.tags:
        logger.info("Delete the project that was created")
        client = RequestManager()
        client.set_method('DELETE')
        id_project = context.response.json()['id']
        client.set_endpoint('/projects/' + str(id_project))
        client.execute_request()
