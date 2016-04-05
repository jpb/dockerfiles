.DEFAULT_GOAL := help
.PHONY: help

# default to shell user if otherwise unset
USERNAME ?= $(USER)

help: ## target descriptions and usage
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort | awk 'BEGIN {FS = ":.*?## "}; \
		{printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

deps: ## ensure all required dependencies are present
	@hash docker > /dev/null 2>&1 || \
	(printf "\n"; \
		echo "ERROR: Please install Docker to continue"; \
		echo "https://docs.docker.com"; \
		printf "\n"; \
		exit 1)

ifneq (,$(wildcard $(HOME)/.docker/config.json))
else
	@(printf "\n"; \
		echo  "ERROR: Missing Docker Hub credential file." \
		echo "Run 'docker login' as this user."; \
		printf "\n"; \
		exit 1) 
endif

build_deps: deps
ifndef VERSION
	@(printf "\n"; \
		echo "ERROR: You must provide an image version"; \
		echo "make build VERSION=0.0.1"; \
		printf "\n"; \
		exit 1)
endif
ifndef NAME
	@(printf "\n"; \
		echo "ERROR: You must provide an image name"; \
		echo "make build NAME=aws"; \
		printf "\n"; \
		exit 1)
endif

build: build_deps ## build and tag docker image
	docker build -t $(USER)/$(NAME):$(VERSION) --rm $(NAME)

tag_latest: build_deps
	docker tag -f $(USER)/$(NAME):$(VERSION) $(NAME):latest

release: tag_latest ## push built image to docker repository
	@(if ! docker images $(USER)/$(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); \
		then echo "ERROR: $(NAME) version $(VERSION) is not yet built."; \
		echo "Please run 'make build'"; false; fi)
	docker push $(USER)/$(NAME)
