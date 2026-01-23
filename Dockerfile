FROM alpine:latest

# Install CA certificates for HTTPS connections
RUN apk --no-cache add ca-certificates

# Set working directory
WORKDIR /app

# Copy the compiled binary and configuration
COPY publish_output/my-dazl-project /app/
COPY publish_output/logging.yaml /app/

# Run the application
CMD ["/app/my-dazl-project"]
