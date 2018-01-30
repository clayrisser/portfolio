CWD := $(shell pwd)
TAG := latest
IMAGE := "jamrizzi/portfolio:$(TAG)"
SOME_CONTAINER := $(shell echo some-$(IMAGE) | sed 's/[^a-zA-Z0-9]//g')
DOCKERFILE := $(CWD)/Dockerfile

.PHONY: all
all: clean deps build

.PHONY: start
start: deps clean
	@bundle exec jekyll serve --verbose

.PHONY: build
build: build-jekyll build-docker
	@echo ::: BUILD :::
.PHONY: build-jekyll
build-jekyll: deps clean
	@bundle exec jekyll build --verbose
	@echo ::: BUILD JEKYLL :::
build-docker: deps
	@docker build --build-arg tag=$(TAG) -t $(IMAGE) -f $(DOCKERFILE) $(CWD)
	@echo ::: BUILD DOCKER :::

.PHONY: pull
pull:
	@docker pull $(IMAGE)
	@echo ::: PULL :::

.PHONY: push
push:
	@docker push $(IMAGE)
	@echo ::: PUSH :::

.PHONY: info
info:
	@docker inspect -f '{{.Config.Labels}}' $(IMAGE)

.PHONY: up
up:
	@docker-compose -f docker-compose.yml up --force-recreate

.PHONY: run
run:
	@docker-compose -f docker-compose.yml run portfolio

.PHONY: ssh
ssh:
	@export CONTAINER_NAME=$$(docker ps --format '{{.Names}}' | grep -m 1 portfolio_portfolio_) && \
    if [ "$$CONTAINER_NAME" = "" ]; then \
    docker-compose -f docker-compose.yml run --entrypoint /bin/sh portfolio; else \
    echo "ssh into $$CONTAINER_NAME" && \
    docker exec -it $$CONTAINER_NAME /bin/sh; fi

.PHONY: install
install: deps
	-@rm -f Gemfile.lock &>/dev/null || true
	@bundle install
	@echo ::: INSTALL :::

.PHONY: clean
clean:
	-@rm -rf _site &>/dev/null || true
	@echo ::: CLEAN :::

.PHONY: deps
deps: bundle docker
	@echo ::: DEPS :::
.PHONY: bundle
bundle:
	@if ! o=$$(which bundle); then gem install bundle jekyll; fi
.PHONY: docker
docker:
	@if ! o=$$(which docker); then curl -L https://get.docker.com | bash; fi
	@echo ::: DOCKER :::
