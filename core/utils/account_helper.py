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
