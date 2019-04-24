from core.rest_client.request_manager import RequestManager

import json

class WorkspaceHelper:

    @staticmethod
    def get_project_id(proj_ids, id, text):
        if id in text:
            data = text.replace(id, str(proj_ids))
        else:
            data = text
        print("final data: ", data)

        return data
    @staticmethod
    def delete_workspace(response):
        '''
        Delete Workspace
        :param response: Json
        '''
        client = RequestManager()
        client.set_method('DELETE')
        id_workspace = response['id']
        client.set_endpoint('/my/workspaces/' + str(id_workspace))
        client.execute_request()

    @staticmethod
    def create_workspace(response):
        '''
        Create workspace
        :return: Workspace Json
        '''
        client = RequestManager()
        client.set_method('POST')
        id_project = response['id']
        # id_project = response
        client.set_endpoint('/my/workspaces')
        body = {"name": "Project Test2", "project_ids": [id_project]}
        client.set_body(json.dumps(body))
        response = client.execute_request()
        print(response.text)
        return response.json()
