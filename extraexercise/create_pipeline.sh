#!/bin/bash
source ../credential.sh
aws sts get-caller-identity | jq
source ../exercise2/util.sh
codestararn=$(aws ssm get-parameter --name CodeStarARN --query Parameter.Value | xargs)
create_stack "apicodepipeline" "apicodepipeline.yaml" "--parameters ParameterKey=SourceConnectionArn,ParameterValue="$codestararn