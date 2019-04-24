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
        Delete project
        :param response: Json
        '''
        client = RequestManager()
        client.set_method('DELETE')
        id_project = response['id']
        client.set_endpoint('/epics/' + str(id_project))
        client.execute_request()
<<<<<<< HEAD

    @staticmethod
    def long_string(length):
        return "x" * length

=======
>>>>>>> e057c20a26ff0a9eba48bb477eb97fd88dc0763a
