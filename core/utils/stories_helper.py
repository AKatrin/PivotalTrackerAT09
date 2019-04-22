from core.rest_client.request_manager import RequestManager

class Stories_helper:

    @staticmethod
    def get_all_story_by_id_stories(proj_id):
        client = RequestManager()
        client.set_method('GET')
        client.set_endpoint('/projects/' + str(proj_id) + '/stories')
        response = client.execute_request()
        return response.json()['id']

    @staticmethod
    def create_stories(proj_id):
        client = RequestManager()
        client.set_method('POST')
        client.set_endpoint('/projects/' + str(proj_id) + '/stories')
        client.set_body(
            """
            {"name": "Test_001"}
            """
        )
        return client.execute_request().json()['id']
