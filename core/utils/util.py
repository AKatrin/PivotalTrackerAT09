class Utils:
    @staticmethod
    def change_endpoint(label_id, id, endpoint):

        endpoint = endpoint.replace(label_id, str(id))
        return endpoint

    @staticmethod
    def check_endpoint(endpoint, ids):
        i = 0
        lenght = len(ids)
        while lenght > i:
            string = endpoint[endpoint.find("{"): endpoint.find("}")+1]
            endpoint = Utils.change_endpoint(string, ids[i], endpoint)
            i += 1
        return endpoint

a = Utils
a = a.check_endpoint("/projects", [])
print(a)