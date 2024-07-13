# Define the image name
IMAGE := sebinalbert/go-containerized-api

# Define the default version
VER := latest

# Define the Docker build command
DOCKER_BUILD_CMD := docker build . -t $(IMAGE):$(VER)

# Define the tag command
DOCKER_TAG_CMD := docker tag gt-editor-$(LANG):$(VER) $(REPO)/gt-editor-$(LANG):$(VER)

# Define the push command
DOCKER_PUSH_CMD := docker push $(REPO)/gt-editor-$(LANG):$(VER)

# Define the Docker clean build command
DOCKER_CLEAN_BUILD_CMD := docker build --no-cache --compress -t gt-editor-$(LANG):$(VER) -f $(LANG).Dockerfile .

push: 


# Define the build target
docker-build:
	@if [ -z "$(ACTION)" ]; then \
		echo "Please specify the 'ACTION' parameter. Supported actions: $(ACTIONS)"; \
		exit 1; 
	fi
	@if ! echo "$(ACTIONS)" | grep -wq "$(ACTION)"; then \
		echo "Unsupported action: $(ACTION). Supported actions: $(ACTIONS)"; \
		exit 1; 
	fi
	$(DOCKER_BUILD_CMD)

# Define the push target
docker-push:
	@if [ -z "$(ACTION)" ]; then \
		echo "Please specify the 'ACTION' parameter. Supported actions: $(ACTIONS)"; \
		exit 1; 
	fi
	@if ! echo "$(ACTIONS)" | grep -wq "$(ACTION)"; then \
		echo "Unsupported action: $(ACTION). Supported actions: $(ACTIONS)"; \
		exit 1; 
	fi
	$(DOCKER_PUSH_CMD)