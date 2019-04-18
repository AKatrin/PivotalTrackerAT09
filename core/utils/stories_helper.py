from core.rest_client.request_manager import RequestManager

class Stories_helper:

    @staticmethod
    def get_all_Story_by_Id(id):
        client = RequestManager()
        client.set_method('GET')
        client.set_endpoint('/projects/' + str(id) + '/stories')
        response = client.execute_request()
        return response.json()
