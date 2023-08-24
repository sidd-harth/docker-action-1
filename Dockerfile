# Use an official minimal Ubuntu image as the base image
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC


# Install fortune, boxes, jq (for JSON parsing), and curl (for making API requests)
RUN apt-get update && apt-get install -y fortune boxes jq curl

# Make the entrypoint.sh script executable


COPY entrypoint.sh /entrypoint.sh
 RUN chmod +x /entrypoint.sh
# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

# Add labels to the Docker image
LABEL "com.github.actions.name"="Fortune Commenter"
LABEL "com.github.actions.description"="Add a fortune message as a comment on new pull requests"
LABEL "com.github.actions.icon"="message-circle"
LABEL "com.github.actions.color"="purple"
