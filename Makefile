IMAGE:=golang-proto
VERSION:=14.6-3.12.3-buster

docker:
	docker build -t $(IMAGE):$(VERSION) .
