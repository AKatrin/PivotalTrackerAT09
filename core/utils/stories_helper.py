from core.rest_client.request_manager import RequestManager

class Stories_helper:

    # @staticmethod
    # def get_all_story_by_id_stories(id):
    #     client = RequestManager()
    #     client.set_method('GET')
    #     client.set_endpoint('/projects/' + str(id) + '/stories')
    #     response = client.execute_request()
    #     return response.json()

    @staticmethod
    def create_stories(id):
        client = RequestManager()
        client.set_method('POST')
        client.set_endpoint('/projects/{id}/stories'.format(id = str(id)))
        client.set_body(
            """
            {"name": "Exhaust ports are ray shielded 👹"}
            """
        )
        return client.execute_request().json()['id']
