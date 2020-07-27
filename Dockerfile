FROM golang:1.14.6-buster

RUN apt-get update && apt-get install -y ca-certificates unzip curl git make bash

ENV PROTO_ROOT_DIR=/usr/local/include
ENV PROTOC_VERSION=3.12.3
ENV PROTOC_ZIP=protoc-$PROTOC_VERSION-linux-x86_64.zip

RUN curl -OL  https://github.com/google/protobuf/releases/download/v$PROTOC_VERSION/$PROTOC_ZIP
RUN unzip -o $PROTOC_ZIP -d /usr/local include/*
RUN unzip -o $PROTOC_ZIP -d /usr/ bin/*
RUN go get -d -u google.golang.org/protobuf/cmd/protoc-gen-go && go install google.golang.org/protobuf/cmd/protoc-gen-go

