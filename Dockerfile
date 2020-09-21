FROM golang:1.15.2-buster

RUN apt-get update && apt-get install -y ca-certificates unzip curl git make bash

ENV PROTO_ROOT_DIR=/usr/local/include
ENV PROTOC_VERSION=3.13.0
ENV PROTOC_ZIP=protoc-$PROTOC_VERSION-linux-x86_64.zip
WORKDIR /tmp
RUN cd /tmp
RUN curl -OL  https://github.com/google/protobuf/releases/download/v$PROTOC_VERSION/$PROTOC_ZIP
RUN unzip -o $PROTOC_ZIP -d /usr/local include/*
RUN unzip -o $PROTOC_ZIP -d /usr/ bin/*
RUN git clone -b v1.31.0 https://github.com/grpc/grpc-go
RUN cd grpc-go/cmd/protoc-gen-go-grpc/ && go install .
RUN go get -d -u google.golang.org/protobuf/cmd/protoc-gen-go && go install google.golang.org/protobuf/cmd/protoc-gen-go
RUN apt-get clean autoclean -y
RUN rm -rf /tmp/$PROTOC_ZIP
RUN rm -rf /tmp/grpc-go
