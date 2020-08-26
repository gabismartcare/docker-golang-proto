IMAGE:=golang-proto
VERSION:=15.0-3.12.3-buster

docker:
	docker build -t $(IMAGE):$(VERSION) .
