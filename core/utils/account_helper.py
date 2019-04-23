from core.rest_client.request_manager import RequestManager
import random
import string
import json


class Account_helper:

    @staticmethod
    def create_account():
        if len(Account_helper.get_accounts()) < 5:
            client = RequestManager()
            client.set_method("POST")
            client.set_endpoint("/projects")
            client.set_body(json.dumps(Account_helper.generate_body_account()))
            id_account = client.execute_request().json()['account_id']
        else:
            id_account = Account_helper.get_account_random()['id']
        return id_account

    @staticmethod
    def create_account_membership(account_id):
        client = RequestManager()
        client.set_method("POST")
        client.set_endpoint("/accounts/{account_id}/memberships".format(account_id=account_id))
        client.set_body(
            """
            {
                "email":"AT09@example.com",
                "initials":"AT",
                "name":"Automation Testing"
            }
            """
        )
        client.execute_request()

    @staticmethod
    def get_account_id():
        client = RequestManager()
        client.set_method('GET')
        client.set_endpoint('/accounts')
        response = client.execute_request()
        return response.json()[0]["id"]

    @staticmethod
    def get_accounts():
        client = RequestManager()
        client.set_method('GET')
        client.set_endpoint('/accounts')
        return client.execute_request().json()

    @staticmethod
    def get_account_random():
        account_list = Account_helper.get_accounts()
        return random.choice(account_list)

    @staticmethod
    def generate_body_account():
        account_name = "Account " + ''.join(random.choices(string.digits, k=4))
        project_name = "Project " + ''.join(random.choices(string.digits, k=3))
        body = {"new_account_name": account_name, "name": project_name}
        return body
