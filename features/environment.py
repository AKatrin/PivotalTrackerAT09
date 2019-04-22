from core.utils.account_helper import Account_helper
from core.utils.project_helper import *
from core.utils.stories_helper import *
logger = SingletonLogger().get_logger()


def before_scenario(context, scenario):
    print("***************NEW SCENARIO******************")
    # context.ids = []
    if "get_id_account" in scenario.tags:
        context.ids.append(1091601)
        #todo I have to take the get ID account method
    elif 'create_project' in scenario.tags:
        logger.info("Create a project and get the id of the project")
        context.project = Project_Helper.create_project()
        context.ids = [context.project["id"]]
    elif "create_account" in scenario.tags:
        logger.info("Create an account and get the id account")
        context.ids = [Account_helper.create_account()]
    elif "create_account_memberships" in scenario.tags:
        logger.info("Create a membership and get the id account")
        context.id = Account_helper.create_account()
        context.ids.append(context.id)
        Account_helper.create_account_membership(context.id)
    elif "create_stories" in scenario.tags:
        logger.info("Get all project and get the id of the project")
        my_proj_id = context.ids.get("{proj_id}")
        context.id = Stories_helper.create_stories(my_proj_id)
        print(context.id)



def after_scenario(context, scenario):
    if 'delete_project' in scenario.tags:
        logger.info("Delete the project that was created")
        Project_Helper.delete_project(context.project)



def before_feature(context, feature):
    context.ids = {}
    if 'epic' in feature.tags:
        logger.info("Create a project and get the id of the project")
        context.project = Project_Helper.create_project()
        context.ids = [context.project['id']]
    elif 'stories' in feature.tags:
        logger.info("Create a project and get the id of the project")
        context.project = Project_Helper.create_project()
        context.ids["{proj_id}"] = context.project['id']


def after_feature(context, feature):
    if 'epic' or 'stories' in feature.tags:
        logger.info("Delete the project that was created")
        Project_Helper.delete_project(context.project)
