#!/bin/bash
lambdaname="crudlambda"
source ../credential.sh
aws sts get-caller-identity | jq
source ../exercise2/util.sh
create_stack "apistack" "apiform.yaml"

echo "Update Lambda manually"
cd resources
zip -j -r backend.zip backendcode/*
aws lambda update-function-code --function-name  $lambdaname --zip-file fileb://backend.zip | xargs

echo "Test"
url=$(aws ssm get-parameter --name APIUrl --query Parameter.Value | xargs)
echo "Post a sample data"
curl -d "@data.json" -H "Content-Type: application/json" -X POST $url
echo "List the output"
curl -d "@list.json" -H "Content-Type: application/json" -X POST $url | jq ."output"
