class WorkspaceHelper:

    @staticmethod
    def get_project_id(proj_ids, id, text):
        if id in text:
            data = text.replace(id, str(proj_ids))
        else:
            data = text
        print("final data: ", data)

        return data
