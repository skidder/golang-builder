#!/bin/sh

set -e -o pipefail

echo Building app $1
cd $1

glide install
go build -o $1

if [ "$DOCKER_IMAGE" != "" ]; then
  docker build --rm --tag=$DOCKER_IMAGE .
fi
