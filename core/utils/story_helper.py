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
        Update project with the labels
        :return: Project Json
        '''
        client = RequestManager()
        client.set_method('PUT')
        client.set_endpoint('/projects/' + str(id_project) + '/stories/' + str(id_stories))
        client.set_body(
            """
            {"labels":[{"name":"test label 1"}]}
            """
        )
        response = client.execute_request()
        return response.json()['labels']


    @staticmethod
    def delete_story(id_project, id_stories):
        '''
        Delete storie of a  project
        :param response: Json
        '''
        print("Eliminando el proyecto ")
        client = RequestManager()
        client.set_method('DELETE')
        client.set_endpoint('/projects/' + str(id_project) + "/stories/" + str(id_stories))
        client.execute_request()

    @staticmethod
    def account_me():
        '''
        Get my account id
        :return: Stories Json
        '''
        client = RequestManager()
        client.set_method('GET')
        client.set_endpoint('/me')
        response = client.execute_request()
        return response.json()

    @staticmethod
    def get_all_stories(id_project):
        '''
        Get all stories of a project
        :param id: Integer
        :return: Stories Json
        '''
        client = RequestManager()
        client.set_method('GET')
        client.set_endpoint('/projects/' + str(id_project) + "/stories")
        response = client.execute_request()
        return response.json()
