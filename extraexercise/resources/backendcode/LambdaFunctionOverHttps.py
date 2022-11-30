# Code adapted from https://docs.aws.amazon.com/pt_br/lambda/latest/dg/services-apigateway-tutorial.html

from __future__ import print_function

import boto3
import json
from botocore.exceptions import ClientError
import uuid

print("Loading function")


def handler(event, context):
    """Provide an event that contains the following keys:

    - operation: one of the operations in the operations dict below
    - tableName: required for operations that interact with DynamoDB
    - payload: a parameter to pass to the operation being performed
    """
    # print("Received event: " + json.dumps(event, indent=2))
    if not event.get("body"):
        body = dict()
    else:
        body = json.loads(event.get("body"))
    operation = body.get("operation", "ping")

    if "tableName" in body:
        dynamo = boto3.resource("dynamodb").Table(body["tableName"])

    operations = {
        "create": lambda x: dynamo.put_item(**x),
        "read": lambda x: dynamo.get_item(**x),
        "update": lambda x: dynamo.update_item(**x),
        "delete": lambda x: dynamo.delete_item(**x),
        "list": lambda x: dynamo.scan(**x),
        "echo": lambda x: x,
        "ping": lambda x: "Alive",
    }
    if operation in operations:
        try:
            if operation == "create":
                body["payload"]["Item"]["id"] = str(uuid.uuid4())
            resp = operations[operation](body.get("payload", {}))
            return {
                "statusCode": 200,
                "headers": {
                    "Access-Control-Allow-Headers": "Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
                    "Access-Control-Allow-Origin": "*",
                    "Access-Control-Allow-Methods": "OPTIONS,POST,GET",
                },
                "body": json.dumps({"input": event, "output": resp}),
            }
        except ClientError as err:
            print(err.response["Error"]["Code"], err.response["Error"]["Message"])
            raise
    else:
        raise ValueError('Unrecognized operation "{}"'.format(operation))
