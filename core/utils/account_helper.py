from core.rest_client.request_manager import RequestManager


class Account_helper:
    @staticmethod
    def create_account():
        client = RequestManager()
        client.set_method("POST")
        client.set_endpoint("/projects")
        client.set_body(
            """
            {
                "new_account_name": "my test",
                "name": "Test333"
            }
            """
        )
        return client.execute_request().json()['account_id']

    @staticmethod
    def create_account_membership(id):
        client = RequestManager()
        client.set_method("POST")
        client.set_endpoint("/accounts/{id_account}/memberships".format(id_account=id))
        client.set_body(
            """
            {
                "new_account_name": "my test",
                "name": "Test333"
            }
            """
        )

    @staticmethod
    def get_account_id():
        client = RequestManager()
        client.set_method('GET')
        client.set_endpoint('/accounts')
        response = client.execute_request()
        return response.json()[0]["id"]
