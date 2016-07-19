golang-builder
==============

Simple docker image to build golang apps which are using glide (https://github.com/Masterminds/glide) as dependency manager and a docker image which includes the app. The image is based on the golang:1.6.3-alpine image.

### Usage

#### App

Building the app only

```bash
docker run --rm -v [PATH_TO_YOUR_APP]:/go/src/app golang-builder [FLAGS]
```

#### Docker image

Your app directory should contain a Dockerfile which should be used to build the app docker image. Then you can run

```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v [PATH_TO_YOUR_APP]:/go/src/[APP_DIR_NAME] -e DOCKER_IMAGE [YOUR_DOCKER_IMAGE_NAME] golang-builder [FLAGS]
```

Dockerfile example could be:

```
FROM gliderlabs/alpine

RUN apk add --no-cache ca-certificates

copy ./my_fancy_app /

WORKDIR /

ENTRYPOINT ["/my_fancy_app"]

```

Build command example:


```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/go/src/app -e DOCKER_IMAGE=matlockx/datadog-metrics-tuner matlockx/golang-builder -ldflags "-X=main.buildTime=2016-01-12_11:17:04AM -X=main.gitHash=80cb93c613cf1d5db4cc6c44e2ef27c4636a066a" -o datadog-metrics-tuner
```
