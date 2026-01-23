.PHONY: all build prepare-artifacts display-artifacts clean

# Default target
all: build prepare-artifacts display-artifacts

# Build the Go project
build:
	@echo "Building Go project..."
	cd my-dazl-project && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -v ./...

# Prepare artifacts for publishing
prepare-artifacts:
	@echo "Preparing artifacts..."
	mkdir -p publish_output
	cp my-dazl-project/my-dazl-project publish_output/
	cp my-dazl-project/logging.yaml publish_output/

# Display artifact contents
display-artifacts:
	@echo "Artifact contents:"
	ls -lh publish_output/

# Clean up build artifacts and publish_output
clean:
	@echo "Cleaning up..."
	rm -rf publish_output
	rm -f my-dazl-project/my-dazl-project
