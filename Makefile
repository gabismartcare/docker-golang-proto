IMAGE:=golang-proto
VERSION:=17.0-3.17.3-stretch

docker:
	docker build -t $(IMAGE):$(VERSION) .
