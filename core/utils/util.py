class Utils:
    @staticmethod
    def check_endpoint(endpoint, ids):
        for item in ids:
            endpoint = endpoint.replace(endpoint[endpoint.find("{"): endpoint.find("}")+1], str(item))
        return endpoint
