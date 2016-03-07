.DEFAULT_GOAL := help
.PHONY: help all build

SHELL := /bin/bash
NAME := cspicer/vim

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort | awk 'BEGIN {FS = ":.*?## "}; \
		{printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## build vim images
	@docker build -t $(NAME):base vim-base
	@docker build -t $(NAME):vim-plug vim-plug
	@docker build -t $(NAME)vim:editor vim-editor
	@docker tag -f $(NAME):editor $(NAME):latest

all: build
