FROM golang:1.13.0-buster

RUN apt-get update; apt-get install -y unzip

ENV PROTOC_ZIP=protoc-3.7.1-linux-x86_64.zip
ENV PROTO_ROOT_DIR=/usr/local/include

RUN curl -OL https://github.com/google/protobuf/releases/download/v3.7.1/$PROTOC_ZIP

RUN unzip -o $PROTOC_ZIP -d /usr/local bin/protoc
RUN unzip -o $PROTOC_ZIP -d /usr/local include/*

RUN go get -d -u github.com/golang/protobuf/protoc-gen-go
RUN go install github.com/golang/protobuf/protoc-gen-go
