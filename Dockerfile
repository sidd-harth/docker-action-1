# Use an official Alpine Linux image as the base image
FROM alpine:3.10

# Create a working directory
WORKDIR /usr/src/app

# Copy the action's entrypoint shell script into the container
COPY entrypoint.sh /usr/src/app/entrypoint.sh

# Make the entrypoint.sh script executable
RUN chmod +x /usr/src/app/entrypoint.sh

# Install fortune and boxes, and jq for JSON parsing
RUN apk add --no-cache fortune boxes jq

# Set the entrypoint to your shell script
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

# Add labels to the Docker image
LABEL "com.github.actions.name"="Fortune Commenter"
LABEL "com.github.actions.description"="Add a fortune message as a comment on new pull requests"
LABEL "com.github.actions.icon"="message-circle"
LABEL "com.github.actions.color"="purple"