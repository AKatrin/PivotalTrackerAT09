from core.utils.account_helper import Account_helper
from core.utils.project_helper import *
from core.utils.stories_helper import *
logger = SingletonLogger().get_logger()


def before_scenario(context, scenario):
    print("***************NEW SCENARIO******************")
    context.ids = []
    if "get_id_account" in scenario.tags:
        context.ids.append(1091601)
        #todo I have to take the get ID account method
    elif 'create_project' in scenario.tags:
        logger.info("Create a project and get the id of the project")
        context.ids = [Project_Helper.create_project()["id"]]
    elif "create_account" in scenario.tags:
        logger.info("Create an account and get the id account")
        context.ids = [Account_helper.create_account()]
    elif "create_account_memberships" in scenario.tags:
        logger.info("Create a membership and get the id account")
        context.id = Account_helper.create_account()
        context.ids.append(context.id)
        Account_helper.create_account_membership(context.id)
    elif "get_stories" in scenario.tags:
        logger.info("Get all project and get the id of the project")
        context.ids = [Project_Helper.get_all_projects()[0]['id']]
    elif "get_stories" in scenario.tags:
        logger.info("Get all project and get the id of the project")
        context.ids = [Project_Helper.get_all_projects()[0]['id']]
        context.ids.append(Stories_helper.get_all_Story_by_Id(context.ids[0])[0]['id'])


def after_scenario(context, scenario):
    if 'delete_project' in scenario.tags:
        logger.info("Delete the project that was created")
        Project_Helper.delete_project(context.response.json())


def before_feature(context, feature):
    context.ids = []
    if 'epic' in feature.tags:
        logger.info("Create a project and get the id of the project")
        context.project = Project_Helper.create_project()
        context.ids = [context.project['id']]


def after_feature(context, feature):
    if 'epic' in feature.tags:
        logger.info("Delete the project that was created")
        Project_Helper.delete_project(context.project)
