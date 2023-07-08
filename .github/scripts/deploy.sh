#!/bin/bash
set -eux -o pipefail

ARCH=x86
REGION=us-west-2
AWS_ACCOUNT_ID=721756646069
REPO_NAME=algo-bench
CLUSTER_NAME=f-development-$REPO_NAME
SERVICE_NAME=f-development-$REPO_NAME-main
MYSQL_IMAGE=f-development-$REPO_NAME-mysql:linux-$ARCH
RAILS_IMAGE=f-development-$REPO_NAME-rails:linux-$ARCH
ECR_URI=$AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ECR_URI

docker buildx build \
--progress plain \
-t $ECR_URI/$MYSQL_IMAGE \
--platform=local \
--provenance=false \
--push \
./mysql

docker buildx build \
--progress plain \
-t $ECR_URI/$RAILS_IMAGE \
--platform=local \
--provenance=false \
--push \
./rails

  aws ecs update-service --cluster $CLUSTER_NAME --service $SERVICE_NAME --force-new-deployment --region $REGION 1>/dev/null