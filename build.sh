#!/bin/sh

set -e -o pipefail

echo Building app with command: "$@"

cd app

glide install

$@

if [ "$DOCKER_IMAGE" != "" ]; then
  docker build --rm --tag=$DOCKER_IMAGE .
fi
