FROM golang:1.13.5-alpine3.11

RUN apk add ca-certificates unzip curl git make protoc bash

ENV PROTO_ROOT_DIR=/usr/local/include
ENV PROTOC_VERSION=3.11.2
ENV PROTOC_ZIP=protoc-$PROTOC_VERSION-linux-x86_64.zip

RUN curl -OL  https://github.com/google/protobuf/releases/download/v$PROTOC_VERSION/$PROTOC_ZIP
RUN unzip -o $PROTOC_ZIP -d /usr/local include/*

RUN go get -d -u github.com/golang/protobuf/protoc-gen-go
RUN go install github.com/golang/protobuf/protoc-gen-go
