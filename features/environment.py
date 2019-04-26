from core.utils.account_helper import Account_helper
from core.utils.epic_helper import EpicHelper
from core.utils.project_helper import *
from core.utils.stories_helper import *
from core.utils.story_helper import Story_Helper
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
    elif 'create_epic' in scenario.tags:
        logger.info("Create a epic and get the id of the project")
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
    elif "get_id_account_of_other_user" in scenario.tags:
        logger.info("Get the id the a account of other user account")
        context.ids["{id}"] = Account_helper.get_account_of_other_user()
    if "create_workspace" in scenario.tags:
        logger.info("Create a project and get the id of the project")
        context.workspace = WorkspaceHelper.create_workspace(context.project)
        context.ids["{workspace_id}"] = context.workspace["id"]

    if "create_stories" in scenario.tags:
        logger.info("Get all project and get the id of the project")
        context.ids["{story_id}"] = Stories_helper.create_stories(context.ids.get("{proj_id}"))

    elif "create_stories_project" in scenario.tags:
        context.project = Project_Helper.create_project()
        context.ids["{proj_id}"] = context.project["id"]
        context.ids["{stories_id}"] = Stories_helper.create_stories(context.project["id"])

    elif "delete_stories_by_id" in scenario.tags:
        context.project = Project_Helper.create_project()
        context.ids["{proj_id}"] = context.project["id"]
        context.ids["{stories_id}"] = Stories_helper.create_stories(context.project["id"])
        context.del_stories = Story_Helper.delete_story(context.ids["{proj_id}"], context.ids["{stories_id}"])


def after_scenario(context, scenario):
    if "delete_project" in scenario.tags:
        logger.info("Delete the project that was created")
        try:
            Project_Helper.delete_project(context.project)
        except AttributeError:
            Project_Helper.delete_project(context.response.json())
    if "delete_workspace" in scenario.tags:
        logger.info("Delete a Workspace")
        workspace = context.response.json()
        id_workspace = context.ids.get("{workspace_id}") if type(workspace) is list else workspace["id"]
        WorkspaceHelper.delete_workspace(id_workspace)


def before_feature(context, feature):
    context.ids = {}
    if 'project' in feature.tags or "stories" in feature.tags or 'epic' in feature.tags:
        logger.info("Create a project and get the id of the project")
        context.project = Project_Helper.create_project()
        context.ids["{proj_id}"] = context.project['id']
    if 'workspace' in feature.tags:
        logger.info("Create two projects for workspace")
        context.projects = Project_Helper.create_projects(2)


def after_feature(context, feature):
    if 'stories' in feature.tags or 'project' in feature.tags:
        logger.info("Delete the project that was created")
        Project_Helper.delete_project(context.project)
    elif 'workspace' in feature.tags:
        logger.info("Delete the project that was created")
        Project_Helper.delete_projects(context.projects)
