#!/bin/bash
# Create code deploy app
aws deploy create-application --application-name velocity-ecs-app --compute-platform ECS --region us-west-2

aws deploy create-deployment-group --cli-input-json file://code_deployment_group1.json --region us-west-2

aws deploy create-deployment \
    --application-name velocity-ecs-app \
    --deployment-group-name velocity-ecs

aws deploy create-deployment \
    --application-name velocity-ecs-app \
    --deployment-group-name velocity-ecs \
    --revision revisionType='String',string={content='version:'} 

aws deploy create-deployment \
    --application-name velocity-ecs-app \
    --deployment-group-name velocity-ecs \
    --cli-input-json file://create-deployment.json \
    --region us-west-2

    --revision revisionType='AppSpecContent' \