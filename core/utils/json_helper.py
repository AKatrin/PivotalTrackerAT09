import json

class JsonHelper:

    @staticmethod
    def print_pretty_json(data):
        print(json.dumps(data, sort_keys=False, indent=4, separators=(',', ': ')))

    @staticmethod
    def obtain_json(self):
        pass

    @staticmethod
    def compare_json_against_json(modified_json, actual_json):
        answer = False
        for item in actual_json:
            if modified_json[item] == actual_json[item]:
                answer = True
            else:
                answer = False
                break
        return answer
