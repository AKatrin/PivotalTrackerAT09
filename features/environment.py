from core.utils.account_helper import Account_helper
from core.utils.epic_helper import EpicHelper
from core.utils.project_helper import *
from core.utils.stories_helper import *
logger = SingletonLogger().get_logger()


def before_scenario(context, scenario):
    print("***************NEW SCENARIO******************")
<<<<<<< HEAD
    # context.ids = []
=======
>>>>>>> 3546072a2b701fdc0a06d5587d63eeb81c849fb6
    if "get_id_account" in scenario.tags:
        context.ids["{account_id}"] = 1091601
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
<<<<<<< HEAD
        context.id = Account_helper.create_account()
        context.ids.append(context.id)
        Account_helper.create_account_membership(context.id)
    elif "create_stories" in scenario.tags:
        logger.info("Get all project and get the id of the project")
        context.ids["{story_id}"] = Stories_helper.create_stories(context.ids.get("{proj_id}"))
        print(context.ids)
=======
        context.ids["{id}"] = Account_helper.create_account()
        Account_helper.create_account_membership(context.ids["{id}"])
    elif "get_stories" in scenario.tags:
        logger.info("Get all project and get the id of the project")
        context.ids["{proj_id}"] = Project_Helper.get_all_projects()[0]['id']
    elif "get_stories" in scenario.tags:
        logger.info("Get all project and get the id of the project")
        context.ids["{proj_id}"] = Project_Helper.get_all_projects()[0]['id']
        context.ids["{id_story}"] = Stories_helper.get_all_Story_by_Id(context.ids["{proj_id}"])[0]['id']
>>>>>>> 3546072a2b701fdc0a06d5587d63eeb81c849fb6


def after_scenario(context, scenario):
    if 'delete_project' in scenario.tags:
        logger.info("Delete the project that was created")
<<<<<<< HEAD
        Project_Helper.delete_project(context.project)
=======
        try:
            Project_Helper.delete_project(context.project)
        except:
            Project_Helper.delete_project(context.response.json())
>>>>>>> 3546072a2b701fdc0a06d5587d63eeb81c849fb6


def before_feature(context, feature):
    context.ids = {}
    if 'epic' in feature.tags:
        logger.info("Create a project and get the id of the project")
        context.project = Project_Helper.create_project()
<<<<<<< HEAD
        context.ids = [context.project['id']]
    elif 'stories' in feature.tags:
        logger.info("Create a project and get the id of the project")
        context.project = Project_Helper.create_project()
=======
>>>>>>> 3546072a2b701fdc0a06d5587d63eeb81c849fb6
        context.ids["{proj_id}"] = context.project['id']


def after_feature(context, feature):
<<<<<<< HEAD
    if 'epic' or 'stories' in feature.tags:
        logger.info("Delete the project that was created")
        Project_Helper.delete_project(context.project)
    elif 'delete_project_epic' in scenario.tags:
        logger.info("Delete the project that was created for epics")
        Project_Helper.delete_project_by_id(Repository.get_instance().get_id('proj_id'))
=======
    if 'epic' in feature.tags:
        logger.info("Delete the project that was created")
        Project_Helper.delete_project(context.project)
>>>>>>> 3546072a2b701fdc0a06d5587d63eeb81c849fb6
