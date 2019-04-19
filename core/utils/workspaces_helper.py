from core.rest_client.request_manager import RequestManager


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
        Delete workspace
        :param response: Json
        '''
        client = RequestManager()
        client.set_method('DELETE')
        id_workspace = response['id']
        client.set_endpoint('/my/workspaces/' + str(id_workspace))
        client.execute_request()
