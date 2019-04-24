from jsonschema.validators import Draft7Validator
import json


class Schema_Helper:

    @staticmethod
    def compare_schema(object, schema_name):

        url_schema = "./schemas/{schema}.json".format(schema=schema_name)
        with open(url_schema) as file:
            schema = json.load(file)
        validator = Draft7Validator(schema)
        errors = sorted(validator.iter_errors(object), key=lambda e: e.path)
        return errors

    @staticmethod
    def compare_all_schema(object, schema_name):
        error = []
        for item in range(len(object)):
            result = Schema_Helper.compare_schema(object[item], schema_name)
            if result != []:
                error.append(result)
        return error
