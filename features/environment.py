from core.rest_client.request_manager import *
from core.utils.project_helper import *
logger = SingletonLogger().get_logger()


def before_scenario(context, scenario):
    print("***************NEW SCENARIO******************")
    if "get_id_account" in scenario.tags:
        context.id = 1091601
        #todo I have to take the get ID account method
    elif 'create_project' in scenario.tags:
        logger.info("Create a project and get the id of the project")
        context.id = Project_Helper.create_project()["id"]
    elif "create_account" in scenario.tags:
        client = RequestManager()
        client.set_method("POST")
        client.set_endpoint("/projects")
        client.set_body(
            """
            {
                "new_account_name": "my test",
                "name": "Test333"
            }
            """
        )
        res = client.execute_request()
        context.id = res.json()['account_id']


def after_scenario(context, scenario):
    if 'delete_project' in scenario.tags:
        logger.info("Delete the project that was created")
        Project_Helper.delete_project(context.response.json())

