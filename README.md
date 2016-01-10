golang-builder
==============

Simple docker image to build golang apps which are using glide (https://github.com/Masterminds/glide) as dependency manager and a docker image which includes the app. The image is based on the golang:1.5.2-alpine image.

### Usage

#### App

Building the app only

```bash
docker run --rm -v [PATH_TO_YOUR_APP]:/go/src/app golang-builder [APP_NAME]
```

#### Docker image

Your app directory should contain a Dockerfile which should be used to build the app docker image. Then you can run

```bash
docker run --rm -v [PATH_TO_YOUR_APP]:/go/src/[APP_DIR_NAME] -e DOCKER_IMAGE [YOUR_DOCKER_IMAGE_NAME] golang-builder [APP_NAME]
```

Dockerfile example could be:

```
FROM gliderlabs/alpine

RUN apk add --no-cache ca-certificates

copy ./my_fancy_app /

WORKDIR /

ENTRYPOINT ["/my_fancy_app"]

```
