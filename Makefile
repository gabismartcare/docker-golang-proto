IMAGE:=golang-proto
VERSION:=16.2-3.15.6-stretch

docker:
	docker build -t $(IMAGE):$(VERSION) .
