# Everything runs inside the image defined by the Dockerfile, so the build does
# not depend on which fonts happen to be installed on this machine.

IMAGE ?= cv-builder
SRC   ?= main.typ
OUT   ?= cv.pdf

# Run as the invoking user so the generated PDF belongs to you, not to root.
DOCKER_RUN = docker run --rm \
	--user $(shell id -u):$(shell id -g) \
	--volume "$(CURDIR)":/cv \
	--workdir /cv \
	$(IMAGE)

# Rebuilding the image on every target would be wasteful, so gate it on a stamp
# file that tracks the Dockerfile's mtime.
STAMP := .make/image

.PHONY: all build check watch shell fonts image clean re help

all: build

$(STAMP): Dockerfile
	docker build --tag $(IMAGE) .
	@mkdir -p $(dir $(STAMP)) && touch $(STAMP)

image: ## rebuild the build image from scratch
	docker build --no-cache --tag $(IMAGE) .
	@mkdir -p $(dir $(STAMP)) && touch $(STAMP)

build: $(STAMP) ## compile the CV and verify the result
	$(DOCKER_RUN) scripts/build.sh

check: build ## alias for build — same checks CI runs

watch: $(STAMP) ## recompile on every save
	docker run --rm -it \
		--user $(shell id -u):$(shell id -g) \
		--volume "$(CURDIR)":/cv \
		--workdir /cv \
		$(IMAGE) typst watch $(SRC) $(OUT)

fonts: $(STAMP) ## list the fonts Typst can see, with their variants
	$(DOCKER_RUN) typst fonts --variants

shell: $(STAMP) ## open a shell inside the build image
	docker run --rm -it \
		--user $(shell id -u):$(shell id -g) \
		--volume "$(CURDIR)":/cv \
		--workdir /cv \
		$(IMAGE) bash

clean: ## remove the generated PDF
	@rm -f $(OUT)

re: clean build ## rebuild from a clean slate

help: ## show this help
	@grep -E '^[a-z-]+:.*?## ' $(MAKEFILE_LIST) \
		| awk -F':.*?## ' '{ printf "  make %-8s %s\n", $$1, $$2 }'
