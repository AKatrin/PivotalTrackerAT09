from core.utils.account_helper import Account_helper
from core.utils.epic_helper import EpicHelper
from core.utils.project_helper import *
from core.utils.stories_helper import *
logger = SingletonLogger().get_logger()


def before_scenario(context, scenario):
    print("***************NEW SCENARIO******************")
    if "get_id_account" in scenario.tags:
        context.ids["{account_id}"] = Account_helper.get_account_id()
    elif 'create_project' in scenario.tags:
        logger.info("Create a project and get the id of the project")
        context.project = Project_Helper.create_project()
        context.ids["{proj_id}"] = context.project["id"]
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


def after_scenario(context, scenario):
    if 'delete_project' in scenario.tags:
        logger.info("Delete the project that was created")
        try:
            Project_Helper.delete_project(context.project)
        except:
            Project_Helper.delete_project(context.response.json())


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
