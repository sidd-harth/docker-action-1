# Use an official minimal Ubuntu image as the base image
FROM ubuntu:20.04-minimal

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Create a working directory
WORKDIR /usr/src/app

# Copy the action's entrypoint shell script into the container
COPY entrypoint.sh /usr/src/app/entrypoint.sh

# Make the entrypoint.sh script executable
RUN chmod +x /usr/src/app/entrypoint.sh

# Install fortune, boxes, jq (for JSON parsing), and curl (for making API requests)
RUN apt-get update && apt-get install -y fortune boxes jq curl

# Set the entrypoint to your shell script
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

# Add labels to the Docker image
LABEL "com.github.actions.name"="Fortune Commenter"
LABEL "com.github.actions.description"="Add a fortune message as a comment on new pull requests"
LABEL "com.github.actions.icon"="message-circle"
LABEL "com.github.actions.color"="purple"