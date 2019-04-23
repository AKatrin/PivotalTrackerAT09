from core.utils.account_helper import Account_helper
from core.utils.epic_helper import EpicHelper
from core.utils.project_helper import *
from core.utils.stories_helper import *
from core.utils.workspace_helper import WorkspaceHelper

logger = SingletonLogger().get_logger()


def before_scenario(context, scenario):
    print("***************NEW SCENARIO******************")
    if "get_id_account" in scenario.tags:
        context.ids["{account_id}"] = Account_helper.get_account_id()
    elif 'create_project' in scenario.tags:
        logger.info("Create a project and get the id of the project")
        context.project = Project_Helper.create_project()
        context.ids["{proj_id}"] = context.project["id"]
        print("create a project: ", context.ids.get("{proj_id}"))
    elif 'create_epic' in scenario.tags:
        logger.info("Create a project and get the id of the project")
        context.project = Project_Helper.create_project()
        context.ids["{proj_id}"] = context.project["id"]
        context.ids["{epic_id}"] = EpicHelper.create_epic(context.ids["{proj_id}"])["id"]
    elif "create_account" in scenario.tags:
        logger.info("Create an account and get the id account")
        context.ids["{id}"] = Account_helper.create_account()
    elif "create_account_memberships" in scenario.tags:
        logger.info("Create a membership and get the id account")
        context.ids["{id}"] = Account_helper.create_account()
        Account_helper.create_account_membership(context.ids["{id}"])
    elif "get_stories" in scenario.tags:
        logger.info("Get all project and get the id of the project")
        context.ids["{proj_id}"] = Project_Helper.get_all_projects()[0]['id']
    elif "get_stories" in scenario.tags:
        logger.info("Get all project and get the id of the project")
        context.ids["{proj_id}"] = Project_Helper.get_all_projects()[0]['id']
        context.ids["{id_story}"] = Stories_helper.get_all_Story_by_Id(context.ids["{proj_id}"])[0]['id']
    elif "create_project_for_workspace" in scenario.tags:
        logger.info("Get id of Project for a new Workspace")
        context.project = Project_Helper.create_project()
        context.ids["{proj_id_for_workspace}"] = context.project["id"]
    elif "create_workspace" in scenario.tags:
        logger.info("Create a project and get the id of the project")
        # print("project for a new workspace")
        context.project = Project_Helper.create_project()
        print("project for a new workspace", context.project)
        context.workspace = WorkspaceHelper.create_workspace(context.project)
        context.ids["{workspace_id}"] = context.workspace["id"]
        # context.ids["{proj_id}"] = context.project["id"]

def after_scenario(context, scenario):
    if "delete_project" in scenario.tags:
        logger.info("Delete the project that was created")
        try:
            Project_Helper.delete_project(context.project)
        except:
            Project_Helper.delete_project(context.response.json())
    elif "delete_workspace" in scenario.tags:
        logger.info("Delete the project that was created for create a Workspace")
        Project_Helper.delete_project(context.project)
        WorkspaceHelper.delete_workspace(context.response.json())


def before_feature(context, feature):
    context.ids = {}
    if 'epic' in feature.tags:
        logger.info("Create a project and get the id of the project")
        context.project = Project_Helper.create_project()
        context.ids["{proj_id}"] = context.project['id']


def after_feature(context, feature):
    if 'epic' in feature.tags:
        logger.info("Delete the project that was created")
        Project_Helper.delete_project(context.project)
