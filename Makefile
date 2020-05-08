IMAGE:=golang-proto
VERSION:=14.2-3.11.4-buster

docker:
	docker build -t $(IMAGE):$(VERSION) .
