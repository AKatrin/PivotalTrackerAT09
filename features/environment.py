from core.rest_client.request_manager import RequestManager
from core.utils.json_helper import JsonHelper


def before_all(context):
    #logger.info("Make the call: ")
    client = RequestManager()
    client.set_method('GET')
    client.set_endpoint('/projects')
    response = client.execute_request()
    context.project_id = response.json()[0]['id']
    print("id project", context.project_id)
