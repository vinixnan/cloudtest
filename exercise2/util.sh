#!/bin/bash

create_stack(){
    stack_name=$1
    file_name=$2
    extra_parameters=$3
    echo "Create Bucket Stack "$stack_name" using file: "$file_name
    aws cloudformation create-stack --stack-name $stack_name  --template-body file://$file_name $extra_parameters --capabilities CAPABILITY_IAM | xargs
    echo "Wait for the creation"
    aws cloudformation wait stack-create-complete --stack-name $stack_name
}