#!/bin/bash
stackname="pipelineexercise"
email="vinyciux@gmail.com"

source util.sh

create_stack $stackname"bucket" "bucketscreation.yaml"
create_stack $stackname"sns" "snscreation.yaml" "--parameters ParameterKey=EmailForSNS,ParameterValue="$email