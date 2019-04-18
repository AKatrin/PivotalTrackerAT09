from core.utils.repository import Repository

class EndpointHelper:

    @staticmethod
    def translate_endpoint(endpoint):
        endpoint = endpoint.replace('{epic_id}', str(Repository.get_instance().epic_id))
        return endpoint