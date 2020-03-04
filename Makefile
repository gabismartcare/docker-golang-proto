IMAGE:=golang-proto
VERSION:=14.0-3.11.4-alpine

docker:
	docker build -t $(IMAGE):$(VERSION) .
