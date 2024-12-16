#!/bin/sh

mkdir -p ~/.aws

# Add localstack to config #
[ ! -e ~/.aws/config ] && touch ~/.aws/config
if [ -z "$(cat ~/.aws/config | grep "profile localstack")" ]
then
    echo "Adding localstack to ~/.aws/config"
    echo "[profile localstack]" >> ~/.aws/config
    echo "region=ap-southeast-2" >> ~/.aws/config
    echo "output=json" >> ~/.aws/config
    echo "endpoint_url=http://localhost:4566" >> ~/.aws/config
else
    echo "Found localstack in ~/.aws/config"
fi

# Add localstack to credentials #
[ ! -e ~/.aws/credentials ] && touch ~/.aws/credentials
if [ -z "$(cat ~/.aws/credentials | grep "localstack")" ]
then
    echo "Adding localstack to ~/.aws/credentials"
    echo "[localstack]" >> ~/.aws/credentials
    echo "aws_access_key_id=test" >> ~/.aws/credentials
    echo "aws_secret_access_key=test" >> ~/.aws/credentials
else
    echo "Found localstack in ~/.aws/credentials"
fi

# Setup AWS Profile #
export AWS_PROFILE=localstack