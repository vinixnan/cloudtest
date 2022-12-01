#!/bin/bash
stackname="pipelineexercise"
source ../credential.sh
aws sts get-caller-identity | jq
codestararn=$(aws ssm get-parameter --name CodeStarARN --query Parameter.Value | xargs)
source util.sh

create_stack $stackname"codepipeline" "codepipeline.yaml" "--parameters ParameterKey=SourceConnectionArn,ParameterValue="$codestararn