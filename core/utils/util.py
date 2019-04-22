class Utils:
    @staticmethod
    def check_endpoint(endpoint, ids):
        for item in ids:
            string = endpoint[endpoint.find("{"): endpoint.find("}") + 1]
            if item == string:
                endpoint = endpoint.replace(string, str(ids[string]))
        return endpoint

a={"{proj_id}":55555, "{epic_id}":23444}
url = "/projects/{proj_id}/epics/{epic_id}"
print(Utils.check_endpoint(url, a))