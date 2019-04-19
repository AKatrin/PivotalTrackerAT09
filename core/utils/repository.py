import os


class Repository:
    __instance = None

    epic_id = 0
    project_id = 0

    ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
    EPIC_SCHEMA = os.path.join(ROOT_DIR, "..\\..\\schemas\\epic_schema.json")

    @staticmethod
    def get_instance():
        """ Static access method. """
        if Repository.__instance is None:
            Repository()
        return Repository.__instance

    def __init__(self):
        """ Virtually private constructor. """
        if Repository.__instance is not None:
            raise Exception("This class is a singleton!")
        else:
            Repository.__instance = self