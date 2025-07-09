#!/bin/bash

# Prompt for commit message
echo "Enter commit message:"
read -r commit_message

# Check if commit message is provided
if [ -z "$commit_message" ]; then
    echo "Error: Commit message cannot be empty."
    exit 1
fi

# Stage all changes
echo "Staging changes..."
git add .
if [ $? -ne 0 ]; then
    echo "Error: Failed to stage changes."
    exit 1
fi

# Commit changes
echo "Committing changes..."
git commit -m "$commit_message"
if [ $? -ne 0 ]; then
    echo "Error: Failed to commit. Check if there are changes to commit."
    exit 1
fi

# Pull from remote
echo "Pulling from origin main..."
git pull origin main
if [ $? -ne 0 ]; then
    echo "Error: Pull failed. Resolve conflicts and try again."
    exit 1
fi

# Push to remote
echo "Pushing to origin main..."
git push origin main
if [ $? -ne 0 ]; then
    echo "Error: Push failed. Check your remote or authentication."
    exit 1
fi

echo "Success: Changes staged, committed, pulled, and pushed!"
