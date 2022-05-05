SHELL := /bin/bash

# Global stuff
DOCKER=docker
CONFIG="makefile.json"

# jq
JQ_CONTAINER=imega/jq
JQ=$(DOCKER) run -i $(JQ_CONTAINER) -c -r

# Items from $(CONFIG)
ECR_URI := $(shell cat $(CONFIG) | $(JQ) .aws.ecr.uri)
ECR_REGION := $(shell cat $(CONFIG) | $(JQ) .aws.ecr.region)
AWS_ACCOUNT_ID := $(shell cat $(CONFIG) | $(JQ) .aws.account_id)
IMAGE_NAME := $(shell cat $(CONFIG) | $(JQ) .docker.image_name)


# AWS
AWS_CONTAINER=amazon/aws-cli
AWS_WORKING_PATH=/aws
AWS=$(DOCKER) run -e AWS_SECRET_ACCESS_KEY=$$AWS_SECRET_ACCESS_KEY -e AWS_ACCESS_KEY_ID=$$AWS_ACCESS_KEY_ID $(AWS_CONTAINER)

init:
	$(AWS) ecr-public get-login-password --region $(ECR_REGION) | $(DOCKER) login --username AWS --password-stdin $(ECR_URI)

build:
	$(DOCKER) build . -t $(IMAGE_NAME):$(version)

release:
	$(DOCKER) tag $(IMAGE_NAME):$(version) $(ECR_URI)/$(IMAGE_NAME):$(version)
	$(DOCKER) tag $(IMAGE_NAME):$(version) $(ECR_URI)/$(IMAGE_NAME):latest
	$(DOCKER) push $(ECR_URI)/$(IMAGE_NAME):$(version)
	$(DOCKER) push $(ECR_URI)/$(IMAGE_NAME):latest

all: init build release
