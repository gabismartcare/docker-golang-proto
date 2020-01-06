IMAGE:=golang-proto
VERSION:=13.5-3.11.2-alpine

docker:
	docker build -t $(IMAGE):$(VERSION) .
