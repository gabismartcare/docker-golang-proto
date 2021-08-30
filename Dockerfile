FROM golang:1.17.0-stretch

RUN apt-get update && apt-get install -y ca-certificates unzip curl git make  bash

ENV PROTO_ROOT_DIR=/usr/local/include
ENV PROTOC_VERSION=3.17.3
ENV PROTOC_ZIP=protoc-$PROTOC_VERSION-linux-x86_64.zip
RUN curl -OL  https://github.com/google/protobuf/releases/download/v$PROTOC_VERSION/$PROTOC_ZIP
RUN unzip -o $PROTOC_ZIP -d /usr/local bin/protoc 
RUN unzip -o $PROTOC_ZIP -d /usr/local include/*
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.27.1
ENV PATH="${PATH}:/go/bin"
