from core.utils.epic_helper import EpicHelper
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
    def compare_data_field_against_json(data, json_result, field):
        answer = {}
        if data[field] != json_result[field]:
            answer[field] = "Values are not the same"
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
<<<<<<< HEAD
        elif type_of_json == "epic":
            obtain_json = EpicHelper.get_epic(str(ids["{epic_id}"]))
        return obtain_json
=======
        return obtain_json

    @staticmethod
    def compareProject(body, json_result):
        answer = ""
        body = body["labels"]
        result = json_result["labels"]
        if len(body) == len(result):
            for item in body:
                if str(type(item)).find("dict") > 0:
                    for element in item:
                        flag = False
                        for jsons in result:
                            if jsons[element] == item[element]:
                                flag = True
                                break
                        if flag is False:
                            answer = answer + "The value is not the same in " + element + ": " + item[element]
                elif str(type(item)).find("str") > 0:

                    flag = False
                    for jsons in result:
                        if jsons["name"] == item:
                            flag = True
                            break
                    if flag is False:
                        answer = answer + "The value is not the same in name: " + item
        else:
            answer = "The size of Labels of result are not the same as the body"
        return answer
>>>>>>> master
