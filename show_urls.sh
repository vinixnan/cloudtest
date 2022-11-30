#!/bin/bash
echo "Exercise #1 website"
bucket_public_url=$(aws cloudformation describe-stacks --stack-name "bucketexercise" --query "Stacks[0].Outputs[0].OutputValue" | xargs)
echo $bucket_public_url/curlme.txt

echo "Exercise #2 website"
myregion=$(aws configure get region)
BucketName=$(aws ssm get-parameter --name StaticSiteBucketName --query Parameter.Value | xargs)
echo http://$BucketName.s3-website-${myregion}.amazonaws.com/

echo "Extra Exercise website"
myregion=$(aws configure get region)
BucketName=$(aws ssm get-parameter --name APIStaticBucketName --query Parameter.Value | xargs)
echo http://$BucketName.s3-website-${myregion}.amazonaws.com/