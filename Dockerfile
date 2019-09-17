FROM golang:1.13-alpine

RUN apk update && \
    apk add ca-certificates unzip curl git

ENV PROTOC_VERSION=3.7.1
ENV PROTOC_ZIP=protoc-$PROTOC_VERSION-linux-x86_64.zip
ENV PROTO_ROOT_DIR=/usr/local/include

RUN curl -OL https://github.com/google/protobuf/releases/download/v$PROTOC_VERSION/$PROTOC_ZIP

RUN unzip -o $PROTOC_ZIP -d /usr/local bin/protoc
RUN unzip -o $PROTOC_ZIP -d /usr/local include/*

RUN go get -d -u github.com/golang/protobuf/protoc-gen-go
RUN go install github.com/golang/protobuf/protoc-gen-go
