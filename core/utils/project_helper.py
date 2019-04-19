from core.logger.singleton_logger import SingletonLogger
from core.rest_client.request_manager import *
import json
logger = SingletonLogger().get_logger()


class Project_Helper:

    @staticmethod
    def get_project(id):
        '''
        Get project
        :param id: Integer
        :return: Project Json
        '''
        client = RequestManager()
        client.set_method('GET')
        client.set_endpoint('/projects/' + id)
        response = client.execute_request()
        return response.json()

    @staticmethod
    def get_all_projects():
        '''
        Get project
        :param id: Integer
        :return: Project Json
        '''
        client = RequestManager()
        client.set_method('GET')
        client.set_endpoint('/projects')
        response = client.execute_request()
        return response.json()

    @staticmethod
    def create_project():
        '''
        Create project
        :return: Project Json
        '''
        client = RequestManager()
        client.set_method('POST')
        client.set_endpoint('/projects')
        body = {"name": "Project Test"}
        client.set_body(json.dumps(body))
        response = client.execute_request()
        return response.json()

    @staticmethod
    def delete_project(response):
        '''
        Delete project
        :param response: Json
        '''
        client = RequestManager()
        client.set_method('DELETE')
        id_project = response['id']
        client.set_endpoint('/projects/' + str(id_project))
        client.execute_request()

    @staticmethod
    def delete_project_by_id(id_project):
        '''
        Delete project
        :param id_project: int
        '''
        client = RequestManager()
        client.set_method('DELETE')
        client.set_endpoint('/projects/' + str(id_project))
        client.execute_request()
