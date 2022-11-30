#!/bin/bash
source ../exercise2/util.sh
codestararn="arn:aws:codestar-connections:us-east-1:388895620167:connection/92debe41-c598-4835-ab1d-158f3f7dcf83"
create_stack "apicodepipeline" "apicodepipeline.yaml" "--parameters ParameterKey=SourceConnectionArn,ParameterValue="$codestararn