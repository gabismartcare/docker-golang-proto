IMAGE:=golang-proto
VERSION:=15.2-3.13.0-buster

docker:
	docker build -t $(IMAGE):$(VERSION) .
