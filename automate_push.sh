#!/bin/bash

# Load environment variables from .env file
#!/bin/bash
echo "Task: Automate GitHub File/Folder Upload with Bash Script:"

source .env

# GitHub repository details
USERNAME=$USERNAME
TOKEN=$GITHUB_TOKEN
REPO_NAME=$CircleWomen_FinalProject
# Check if a commit message was provided as an argument, otherwise ask for input
if [ -z "$1" ]; then
    read -p "Enter commit message: " COMMIT_MSG
else
    COMMIT_MSG="$*"
fi

# Git commands
git add .
git commit -m "$COMMIT_MSG"
git remote add origin https://$TOKEN@github.com/$USERNAME/$REPO_NAME.git

git push origin main

