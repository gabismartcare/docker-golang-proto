FROM golang:1.14.2-buster

RUN apt-get update && apt-get install -y ca-certificates unzip curl git make bash

ENV PROTO_ROOT_DIR=/usr/local/include
ENV PROTOC_VERSION=3.11.4
ENV PROTOC_ZIP=protoc-$PROTOC_VERSION-linux-x86_64.zip

RUN curl -OL  https://github.com/google/protobuf/releases/download/v$PROTOC_VERSION/$PROTOC_ZIP
RUN unzip -o $PROTOC_ZIP -d /usr/local include/*
RUN unzip -o $PROTOC_ZIP -d /usr/ bin/*
RUN go get -d -u github.com/golang/protobuf/protoc-gen-go
RUN go install github.com/golang/protobuf/protoc-gen-go
