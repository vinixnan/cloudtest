# CI/CD Exercise

In this exercise, a static website has to be built and deployed automatically using a CI/CD tool. The static website has to be stored in a S3. Moreover, a notification has to be sent indicating the build failed or was successful.

As the exercise #1, we also have the final user accessing a static website hosted in a S3:

![alt text](https://github.com/vinixnan/cloudtest/blob/main/diagram/ex2.png?raw=true)

For my solution, I chose ```AWS CodePipeline``` and  ```AWS Codebuild``` to get the source code, build and deploy. For notifications, a SNS Topic was created and an email subscription was added. The following figure presents the solution:

![alt text](https://github.com/vinixnan/cloudtest/blob/main/diagram/ex2deploy.png?raw=true)

The source code comes from this repository. The interaction between GitHub and AWS is provided by ``ÀWS Codestar Connection``, manually added at the AWS console.

Then, ``Codepipeline`` uses this Github connection, takes the source, and sends it to ``Codebuild`` where the React static website is built, send to S3, and a SNS Publish is called informing the status of the build.

You can open the latest build link at:
```http://ftf.vinicius.bucket.exercise2.s3-website-us-east-1.amazonaws.com```

Everything was created using `Cloudformation`.

## How to easily run

```sh
./create_sns_bucket.sh
./create_code_pipeline.sh
```

## Files Description

| File  | Description  | Parameters
|---|---|---|
| snscreation.yaml  | The cloudformation file responsible for creating the SNS Topic and associated policies  | Email |
| bucketscreation.yaml | The cloudformation file is resposible by creating a static website bucket, an artifact bucket (necessary for ```CodePipeline```) and all associated roles/policies  | - |
| create_sns_bucket.sh  | Runs `aws cloudformation create-stack` for  snscreation.yaml and bucketscreation.yaml | Email |
| codepipeline.yaml  | Cloudformation definitions for ``AWS Codepipeline`` and ``AWS Codebuild`` | ``CodeStar Connection`` ARN |
| create_code_pipeline.sh  | Runs `aws cloudformation create-stack` for codepipeline.yaml  | ``CodeStar Connection`` ARN |
| buildspec.yaml | ``Codebuild`` script, where variables from ``Parameter Store`` are retrieved, the React project built, sent to S3, and where SNS Publish is triggered | All comes from SSM Parameter Store |
| resources/frontend | Just a React hello-world page | - |
| util.sh| Just make the ``àws cloudformation create-stack`` command a bit easier. This is imported by others sh scripts in this directory | - |

## Observations

* ``Codedeploy`` wasn't considered because it does not deploy in S3
