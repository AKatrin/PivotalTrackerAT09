from core.logger.singleton_logger import SingletonLogger
from core.rest_client.request_manager import *
from jsonschema.validators import Draft7Validator

import json
logger = SingletonLogger().get_logger()

class Story_Helper:

    @staticmethod
    def create_stories(project_id):
        '''
        Create stories for a project
        :return: Project Json
        '''
        client = RequestManager()
        client.set_method('POST')
        client.set_endpoint('/projects/' + str(project_id) + '/stories')
        body = {"name": "Project Test"}
        client.set_body(json.dumps(body))
        response = client.execute_request()
        return response.json()

    @staticmethod
    def put_stories(id_project, id_stories):
        '''
        Create project
        :return: Project Json
        '''
        client = RequestManager()
        client.set_method('PUT')
        client.set_endpoint('/projects/' + str(id_project) + '/stories/' + str(id_stories))
        body = {'{"labels":[{"name":"newnew"},{"name":"labellabel"},{"name":"newLabel"}]}'}
        client.set_body(json.dumps(body))
        response = client.execute_request()
        return response.json()


    @staticmethod
    def delete_story(id_project, id_stories):
        '''
        Delete stories of a  project
        :param response: Json
        '''
        print("Eliminando el proyecto ")
        client = RequestManager()
        client.set_method('DELETE')
        client.set_endpoint('/projects/' + str(id_project) + "/stories/" + str(id_stories))
        client.execute_request()



