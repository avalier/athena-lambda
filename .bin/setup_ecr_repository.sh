#!/bin/sh

if [ -z "$1" ]
then
    echo "Usage: $0 <<RepositoryName>>"
    exit 1
fi

export REPOSITORY_NAME=$1
echo "Repository Name: $REPOSITORY_NAME"

# Create/upsert the "repository" if it doesnt exist in the ECR registry //
SEARCH=$(aws ecr describe-repositories | jq -r ".repositories | map(select(.repositoryName == \"$REPOSITORY_NAME\"))[].repositoryName")
if [ -z "$SEARCH" ]
then
    echo "Creating repository $REPOSITORY_NAME..."
    aws ecr create-repository --repository-name "$REPOSITORY_NAME"
fi