IMAGE:=golang-proto
VERSION:=16.0-3.15.5-stretch

docker:
	docker build -t $(IMAGE):$(VERSION) .
