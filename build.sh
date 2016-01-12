#!/bin/sh

set -e -o pipefail

echo Building app with params "$@"

cd app

glide install

go build "$@"

if [ "$DOCKER_IMAGE" != "" ]; then
  docker build --rm --tag=$DOCKER_IMAGE .
fi
