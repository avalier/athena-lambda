#!/bin/sh


if [ -z "$1" ]
then
    echo "Usage: $0 <<JsonFile>>"
    exit 1
fi

curl -v -X POST "http://localhost:9000/2015-03-31/functions/function/invocations" -d @$1