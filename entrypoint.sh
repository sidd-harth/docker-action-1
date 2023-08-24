#!/bin/sh

# Get the pull request number from the GitHub event payload
PR_NUMBER=$(jq --raw-output .pull_request.number "$GITHUB_EVENT_PATH")

# Generate a random funny fortune message
FORTUNE_MESSAGE=$(fortune -o)

# Use the "boxes" utility to format the fortune message
BOXED_MESSAGE=$(echo "$FORTUNE_MESSAGE" | boxes)

# Add a comment to the pull request
curl -X POST \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Content-Type: application/json" \
  -d "{\"body\":\"\`\`\`\n$BOXED_MESSAGE\n\`\`\`\"}" \
  "https://api.github.com/repos/$GITHUB_REPOSITORY/issues/$PR_NUMBER/comments"
