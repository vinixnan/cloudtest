# FTF Platform Engineering IaC Test

## Project organization

A succinct description of each test. More information is in their respective folders.

| Folder  | Description | Latest build|
|---|---|---|
| [diagram](https://github.com/vinixnan/cloudtest/tree/main/diagram) | Has all figures and code to generate the figures | Take a look in [here](https://github.com/vinixnan/cloudtest/blob/main/diagram/diagram_generator.ipynb) |
| [exercise1](https://github.com/vinixnan/cloudtest/tree/main/exercise1) | Create a bucket exercise | <http://ftf.vinicius.bucket.exercise1.s3-website-us-east-1.amazonaws.com/curlme.txt> |
| [exercise2](https://github.com/vinixnan/cloudtest/tree/main/exercise2) | Create a CI/CD exercise | <http://ftf.vinicius.bucket.exercise2.s3-website-us-east-1.amazonaws.com/> |
| [extraexercise](https://github.com/vinixnan/cloudtest/tree/main/extraexercise) | A harder `Create a CI/CD exercise` where Lambda, DynamoDB, and APIGateway are employed. I hope you like | <http://ftf.vinicius.static.apisite.s3-website-us-east-1.amazonaws.com/> |
| show_urls.sh | A simple script to take all the static website URLs | - |

## Tools

The following tools were considered in all the tests.
| Tool  | Description  | Version
|---|---|---|
| AWS Cli  | The standard AWS client| 2.9.2 |
| AWS Cloudformation  | AWS IaC Solution | - |
| Python  | Used to Lambda function code (Extra exercise) and to generate figures| 3.8 |
| Jupyter Notebook  | A good way to show code. take a look at <https://github.com/vinixnan/cloudtest/blob/main/diagram/diagram_generator.ipynb> where I generate AWS diagrams for the three exercises | - |
| Diagrams  | A python library to generate diagrams as code <https://diagrams.mingrammer.com/> | - |
| Shell Script  | Scripts to make my life easier (or not)  | - |

## Before start

Please, make sure you have AWS CLI installed. You gonna need a user with administrator access (AdministratorAccess policy) and configure it by typing ``aws configure``. You also gonna need to provide a GitHub connection (follow the steps at <https://docs.aws.amazon.com/codepipeline/latest/userguide/connections-github.html>) and save the resulting ARN in ``SSM Parameter Store`` as ``CodeStarARN``(see the figure). After this, also set an email also in the Parameter store under the key ``EmailToSendNotification``.

![alt text](https://github.com/vinixnan/cloudtest/blob/main/diagram/parameters.png?raw=true)

## Expected Results

### Bucket exercise

![alt text](https://github.com/vinixnan/cloudtest/blob/main/diagram/ex1_solution.png?raw=true)

## CI/CD Exercise

Codepipeline
![alt text](https://github.com/vinixnan/cloudtest/blob/main/diagram/codepipeline.png?raw=true)
![alt text](https://github.com/vinixnan/cloudtest/blob/main/diagram/codepipeline2.png?raw=true)

SNS Mail
![alt text](https://github.com/vinixnan/cloudtest/blob/main/diagram/mail.png?raw=true)
