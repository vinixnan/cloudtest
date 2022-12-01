#!/bin/bash
stackname="bucketexercise"
bucketname="ftf.vinicius.bucket.exercise1"
source ../credential.sh
CallingUserArn=$(aws sts get-caller-identity | jq -r ".Arn")
echo $CallingUserArn
echo "CallingUserArn="$CallingUserArn
echo "Create Stack"
aws cloudformation create-stack --stack-name $stackname  --template-body file://cloudform.yaml --parameters ParameterKey=BucketName,ParameterValue=$bucketname  ParameterKey=CallingUserArn,ParameterValue=$CallingUserArn --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM | xargs
echo "Wait for the creation"
aws cloudformation wait stack-create-complete --stack-name $stackname

echo "Assume Role S3WriteRole"
ARN=$(aws iam get-role --role-name S3WriteRole | jq -r ".Role.Arn")
aws sts assume-role --role-arn $ARN --role-session-name worker > aws.credentials.json
export AWS_ACCESS_KEY_ID=$(cat aws.credentials.json | jq -r ".Credentials.AccessKeyId")
export AWS_SECRET_ACCESS_KEY=$(cat aws.credentials.json | jq -r ".Credentials.SecretAccessKey")
export AWS_SESSION_TOKEN=$(cat aws.credentials.json | jq -r ".Credentials.SessionToken")
aws sts get-caller-identity | jq

echo "Upload file to bucket s3://"$bucketname
aws s3 cp resources/curlme.txt s3://$bucketname
#get static website from cloudformation output
#bucket_public_url=$(aws cloudformation describe-stacks --stack-name $stackname --query "Stacks[0].Outputs[0].OutputValue" | xargs)
bucket_public_url=$(aws ssm get-parameter --name StaticSiteBucketNameEx1 --query Parameter.Value | xargs)
#echo the full url
echo "You can curl" $bucket_public_url/curlme.txt
curl $bucket_public_url/curlme.txt