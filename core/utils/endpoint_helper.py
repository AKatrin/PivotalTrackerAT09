from core.utils.repository import Repository


class EndpointHelper:

    @staticmethod
    def translate_endpoint(endpoint):
        if '{epic_id}' in endpoint:
            endpoint = endpoint.replace('{epic_id}', str(Repository.get_instance().epic_id))
        if '{proj_id}' in endpoint:
            endpoint = endpoint.replace('{proj_id}', str(Repository.get_instance().project_id))

        return endpoint
