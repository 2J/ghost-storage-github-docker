VERSION := `cat VERSION`
DOCKER_IMAGE_NAME := jjai/ghost-storage-github
DOCKER_IMAGE_TAG := $(VERSION)

# DOCKER COMMANDS
# build docker image
build:
	docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) .
	docker tag $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) $(DOCKER_IMAGE_NAME):latest

# push docker image
push:
	docker push $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)
	docker push $(DOCKER_IMAGE_NAME):latest
