class Utils:
    @staticmethod
    def check_endpoint(endpoint, ids):
        for item in ids:
            string = endpoint[endpoint.find("{"): endpoint.find("}") + 1]
            if item == string:
                endpoint = endpoint.replace(string, str(ids[string]))
        return endpoint

