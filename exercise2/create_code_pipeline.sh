#!/bin/bash
stackname="pipelineexercise"
codestararn="arn:aws:codestar-connections:us-east-1:388895620167:connection/92debe41-c598-4835-ab1d-158f3f7dcf83"

source util.sh

create_stack $stackname"codepipeline" "codepipeline.yaml" "--parameters ParameterKey=SourceConnectionArn,ParameterValue="$codestararn

#echo static website url
myregion=$(aws configure get region)
BucketName=$(aws ssm get-parameter --name StaticSiteBucketName --query Parameter.Value | xargs)
echo http://$BucketName.s3-website-${myregion}.amazonaws.com/