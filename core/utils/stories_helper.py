from core.rest_client.request_manager import RequestManager

class Stories_helper:

    @staticmethod
    def get_all_story_by_id_stories(proj_id):
        client = RequestManager()
        client.set_method('GET')
        client.set_endpoint('/projects/' + str(proj_id) + '/stories')
        response = client.execute_request()
        return response.json()

    @staticmethod
    def create_stories(proj_id):
        client = RequestManager()
        client.set_method('POST')
<<<<<<< HEAD
        client.set_endpoint('/projects/{id}/stories'.format(id = str(id)))
=======
        client.set_endpoint('/projects/' + str(proj_id) + '/stories')
>>>>>>> dbbe46d0f61026606000b707e40103f6f2af63e8
        client.set_body(
            """
            {"name": "Test_01"}
            """
        )
        return client.execute_request().json()['id']
