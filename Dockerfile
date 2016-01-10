FROM golang:1.5.2-alpine

ENV GO15VENDOREXPERIMENT 1

RUN apk add --no-cache git docker gcc
RUN go get github.com/Masterminds/glide
RUN go build github.com/Masterminds/glide

COPY ./build.sh /go/src

VOLUME /go/src
WORKDIR /go/src

ENTRYPOINT ["./build.sh"]
