#!/bin/bash
stackname="bucketexercise"
bucketname="ftf.vinicius.bucket.exercise"
echo "Create Stack"
aws cloudformation create-stack --stack-name $stackname  --template-body file://cloudform.yaml
echo "Wait for the creation"
aws cloudformation wait stack-create-complete --stack-name $stackname
echo "Upload file to bucket s3://"$bucketname
aws s3 cp curlme.txt s3://$bucketname
#get static website from cloudformation output
bucket_public_url=$(aws cloudformation describe-stacks --stack-name $stackname --query "Stacks[0].Outputs[0].OutputValue" | xargs)
#echo the full url
echo "You can curl" $bucket_public_url/curlme.txt
curl $bucket_public_url/curlme.txt