# FTF Platform Engineering IaC Test

## Project organization

A sucint description of each test, more information in their respectives folders.

| Folder  | Description | Latest build|
|---|---|---|
| [diagram](https://github.com/vinixnan/cloudtest/tree/main/diagram) | Has all figures and code to generate the figures | Take a look in [here](https://github.com/vinixnan/cloudtest/blob/main/diagram/diagram_generator.ipynb) |
| [exercise1](https://github.com/vinixnan/cloudtest/tree/main/exercise1) | Create a bucket exercise | <http://ftf.vinicius.bucket.exercise.s3-website-us-east-1.amazonaws.com/curlme.txt> |
| [exercise2](https://github.com/vinixnan/cloudtest/tree/main/exercise2) | Create a CI/CD exercise | <http://ftf.vinicius.bucket.exercise2.s3-website-us-east-1.amazonaws.com/> |
| [extraexercise](https://github.com/vinixnan/cloudtest/tree/main/extraexercise) | A harder `Create a CI/CD exercise` where Lambda, DynamoDB, and APIGateway are employed. I hope you like | <http://ftf.vinicius.static.apisite.s3-website-us-east-1.amazonaws.com/> |
| show_urls.sh | A simple script to take all the static websiteurl | - |

## Tools

The following toos were considered in all the tests.
| Tool  | Description  | Version
|---|---|---|
| AWS Cli  | The standard AWS client| 2.9.2 |
| AWS Cloudformation  | AWS IaC Solution | - |
| Python  | Used to Lambda function code (Extra exercise) and to generate figures| 3.8 |
| Jupyter Notebook  | A good way to show code. take a look in <https://github.com/vinixnan/cloudtest/blob/main/diagram/diagram_generator.ipynb> where I generate AWS diagrams for the three exercises | - |
| Diagrams  | A python library to generate diagram as code <https://diagrams.mingrammer.com/> | - |
| Shell Script  | Scripts to make my life easier (or not)  | - |
