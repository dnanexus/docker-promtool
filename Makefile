
PROM_VERSION=2.12.0
DOCKER_IMAGE=dnanexus/promtool:${PROM_VERSION}

.DEFAULT_GOAL := push

.PHONY: build
build:
	docker build --build-arg prom_version=${PROM_VERSION} -t ${DOCKER_IMAGE} .

.PHONY: push
push: build
	docker push ${DOCKER_IMAGE}
