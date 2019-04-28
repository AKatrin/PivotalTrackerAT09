from core.logger.singleton_logger import SingletonLogger
from core.rest_client.request_manager import *
import json
logger = SingletonLogger().get_logger()


class EpicHelper:

    @staticmethod
    def create_epic(project_id):
        '''
        Create Epic
        :return: epic Json
        '''
        client = RequestManager()
        client.set_method('POST')
        client.set_endpoint('/projects/{0}/epics'.format(project_id))
        body = {"name": "Project Epic"}
        client.set_body(json.dumps(body))
        response = client.execute_request()
        return response.json()

    @staticmethod
    def delete_epic(response):
        '''
        Delete epic
        :param response: Json
        '''
        client = RequestManager()
        client.set_method('DELETE')
        id_project = response['id']
        client.set_endpoint('/epics/' + str(id_project))
        client.execute_request()

    @staticmethod
    def get_epic( id ):
        '''
        Get Epic
        :param response: Json
        '''
        client = RequestManager()
        client.set_method('GET')
        client.set_endpoint('/epics/' + str(id))
        response = client.execute_request()
        return response.json()

    @staticmethod
    def long_string(length):
        return "x" * length


    @staticmethod
    def inject_values(context):
        if "{epic_id}" in context.text:
            context.text = context.text.replace("{epic_id}", str(context.ids["{epic_id}"]))
        if "{long_name_epic}" in context.text:
            context.text = context.text.replace("{long_name_epic}", EpicHelper.long_string(5000))
        if "{long}" in context.text:
            context.text = context.text.replace("{long}", EpicHelper.long_string(20000))
        if "{more_long}" in context.text:
            context.text = context.text.replace("{more_long}", EpicHelper.long_string(20001))
        if "{long_label_name}" in context.text:
            context.text = context.text.replace("{long_label_name}", EpicHelper.long_string(255))
        if "{new_project_ids}" in context.text:
            context.text = context.text.replace("{new_project_ids}", str(context.ids.get("{proj_id}")))
        if "{update_project_ids}" in context.text:
            # print("contest in update:", context.projects[0].get("id"))
            context.text = context.text.replace("{update_project_ids}", str(context.projects[0].get("id")))
        if "{min_velocity_averaged_over}" in context.text:
            context.text = context.text.replace("{min_velocity_averaged_over}",
                                                str(context.project['velocity_averaged_over']))
        return context
