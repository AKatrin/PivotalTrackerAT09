from core.logger.singleton_logger import SingletonLogger
from core.rest_client.request_manager import *
from jsonschema.validators import Draft7Validator

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
    def compare_schema(object):
        with open('../PivotalTrackerAT09/schemas/project_schema.json') as file:
            schema = json.load(file)
        validator = Draft7Validator(schema)
        errors = sorted(validator.iter_errors(object), key=lambda e: e.path)
        return errors

    @staticmethod
    def compare_all_schema(object):
        error = []
        for item in range(len(object)):
            result = Project_Helper.compare_schema(object[item])
            if result != []:
                error.append(result)
        return error
