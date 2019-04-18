class Repository:
    __instance = None

    epic_id = 0

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