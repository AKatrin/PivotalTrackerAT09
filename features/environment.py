from core.utils import workspaces_helper
from core.utils.account_helper import Account_helper
from core.utils.project_helper import *
from core.utils.workspaces_helper import WorkspaceHelper

logger = SingletonLogger().get_logger()


# def before_all(context):
#     #logger.info("Make the call: ")
#     client = RequestManager()
#     client.set_method('GET')
#     client.set_endpoint('/projects')
#     response = client.execute_request()
#     context.project_id = response.json()[0]['id']
#     print("id project", context.project_id)


def before_scenario(context, scenario):
    print("***************NEW SCENARIO******************")
    if "get_id_account" in scenario.tags:
        context.id = 1091601
        #todo I have to take the get ID account method
    elif 'create_project' in scenario.tags:
        logger.info("Create a project and get the id of the project")
        context.id = Project_Helper.create_project()["id"]
    elif "create_account" in scenario.tags:
        context.id = Account_helper.create_account()
    # elif "create_workspace" in scenario.tags:
    #     context.project_ids = Project_Helper.create_project()["id"]
        #context.id_workspace = workspaces_helper.create_workspace()


def after_scenario(context, scenario):
    if 'delete_project' in scenario.tags:
        logger.info("Delete the project that was created")
        Project_Helper.delete_project(context.response.json())
    elif 'delete_workspace' in scenario.tags:
        logger.info("Delete the last workspace created")
        WorkspaceHelper.delete_workspace(context.response.json())
