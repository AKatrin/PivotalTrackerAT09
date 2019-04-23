class Repository:
    __instance = None
    dict_ids = {}

    @staticmethod
    def add_id(name, id_value):
        if name in Repository.get_instance().dict_ids.keys():
            Repository.get_instance().dict_ids[name] = id_value
        else:
            Repository.get_instance().dict_ids.update({name: id_value})

    @staticmethod
    def get_id(name):
        return Repository.get_instance().dict_ids.get(name, 0)

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
