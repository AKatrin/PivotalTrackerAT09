from core.utils.project_helper import *

class JsonHelper:

    @staticmethod
    def print_pretty_json(data):
        print(json.dumps(data, sort_keys=False, indent=4, separators=(',', ': ')))

    @staticmethod
    def compare_data_against_json(data, json_result):
        answer = {}
        for item in data:
            if data[item] != json_result[item]:
                answer[item] = "Values are not the same"
        return answer

    @staticmethod
    def compare_json_against_json(modified_json, actual_json):
        answer = {}
        for item in actual_json:
            if modified_json[item] != actual_json[item]:
                answer[item] = "Value is not the same"
        return answer

    @staticmethod
    def get_json(type_of_json, ids):
        obtain_json = ""
        if type_of_json == "project":
            obtain_json = Project_Helper.get_project(str(ids["{proj_id}"]))
        return obtain_json
