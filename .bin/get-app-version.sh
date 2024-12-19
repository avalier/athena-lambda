#!/bin/sh


if [ -z "$GITHUB_REF" ]
then
    echo "Missing ENV: GITHUB_REF" 
    exit 1
else
    echo "GITHUB_REF: $GITHUB_REF"
fi

if [[ $GITHUB_REF == refs/tags/release/* ]]
then
    export APP_VERSION=$(echo "$GITHUB_REF" | sed "s/refs\/tags\/release\//$secondString/")
else
    export APP_VERSION=""
fi
