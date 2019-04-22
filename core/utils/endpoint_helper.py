from core.utils.repository import Repository


class EndpointHelper:

    @staticmethod
    def translate_endpoint(endpoint):
        for key_name in Repository.get_instance().dict_ids.keys():
            if key_name in endpoint:
                endpoint = endpoint.replace('{'+key_name+'}', str(Repository.get_instance().get_id(key_name)))
        return endpoint
