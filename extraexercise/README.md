# Extra CI/CD Exercise: Deploy a full application

In this exercise, both ``backend`` and ``frontend`` has to be deployed through a CI/CD. For this purpose we have the following scenario:

![alt text](https://github.com/vinixnan/cloudtest/blob/main/diagram/ex3.png?raw=true)

The user accesses a static website hosted in S3, then this static page can submit requests to an ``AWS API GATEWAY`` which just sends all REST requests to a ``AWS Lambda Function``. Inside this function, there is a backend code written in ``Python`` which just takes requests, process, and save/list using a ``AWS DynammoDB Table``.

For my solution, I also chose ```AWS CodePipeline``` and  ```AWS Codebuild``` to get the source code, build and deploy. The difference here is that the ``Lambda Function`` is updated every time Codebuild runs. The following figure presents the solution:

![alt text](https://github.com/vinixnan/cloudtest/blob/main/diagram/ex3deploy.png?raw=true)

This Solution is pretty similar to the one created for Exercise #2.

You can open the latest build link at:
```http://ftf.vinicius.static.apisite.s3-website-us-east-1.amazonaws.com```

Everything was created using `Cloudformation`.

## Files Description

| File  | Description  | Parameters
|---|---|---|
| apiform.yaml  | The cloudformation file responsible for creating S3, Lambda, DynamoDB and API Gateway and all roles/policies associated | - |
| create_api.sh  | Runs `aws cloudformation create-stack` for  apiform.yaml and makes a simple test to the API | - |
| apicodepipeline.yaml  | Cloudformation definitions for ``AWS Codepipeline`` and ``AWS Codebuild`` | ``CodeStar Connection`` ARN |
| create_pipeline.sh  | Runs `aws cloudformation create-stack` for apicodepipeline.yaml  | ``CodeStar Connection`` ARN |
| buildspec.yaml | ``Codebuild`` script, where variables from ``Parameter Store`` are retrieved, the React project built, sent to S3, and where the Lambda Funtion is updated | All comes from SSM Parameter Store |
| resources/frontendcode | A very simple React application | - |
| resources/backendcode | A very simple Python code for the Lambda Function | - |
| resources/data.json| Just a simple data to insert, this is used by  create_api.sh as a test| - |
| resources/list.json| Just a simple data to insert, this is used by  create_api.sh as a test| - |

## Observations

* I could consider ``Codedeploy`` for Lambda deploying, but I decided to run it as a ``aws lambda update-function-code`` to keep Exercise #2 and Extra Exercise similar;
* Scripts here also import exercise2/util.sh
