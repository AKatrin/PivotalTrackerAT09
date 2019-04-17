from core.rest_client.request_manager import *


def before_scenario(context, scenario):
    if "create_account" in scenario.tags:
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
        res = client.execute_request()
        context.id = res.json()['account_id']
