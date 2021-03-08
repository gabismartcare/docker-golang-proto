FROM golang:1.16.0-stretch

RUN apt-get update && apt-get install -y ca-certificates unzip curl git make  bash

ENV PROTO_ROOT_DIR=/usr/local/include
ENV PROTOC_VERSION=3.15.5
ENV PROTOC_ZIP=protoc-$PROTOC_VERSION-linux-x86_64.zip
RUN curl -OL  https://github.com/google/protobuf/releases/download/v$PROTOC_VERSION/$PROTOC_ZIP
RUN unzip -o $PROTOC_ZIP -d /usr/local bin/protoc 
RUN unzip -o $PROTOC_ZIP -d /usr/local include/*
RUN go get google.golang.org/protobuf/cmd/protoc-gen-go google.golang.org/grpc/cmd/protoc-gen-go-grpc 
ENV PATH="${PATH}:/go/bin"
