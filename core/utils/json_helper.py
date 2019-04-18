import json

class JsonHelper:

    @staticmethod
    def print_pretty_json(data):
        print(json.dumps(data, sort_keys=False, indent=4, separators=(',', ': ')))

    @staticmethod
    def get_project_id(context, id, text):
        if id in text:
            data = text.replace(id, str(context.project_id))
        else:
            data = text
        print("final data: ", data)

        return data
