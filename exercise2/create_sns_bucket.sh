#!/bin/bash
stackname="pipelineexercise"
source ../credential.sh
aws sts get-caller-identity | jq
email=$(aws ssm get-parameter --name EmailToSendNotification --query Parameter.Value | xargs)
source util.sh

create_stack $stackname"bucket" "bucketscreation.yaml"
create_stack $stackname"sns" "snscreation.yaml" "--parameters ParameterKey=EmailForSNS,ParameterValue="$email