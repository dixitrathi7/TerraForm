#!/bin/bash

set -e

# Variables
GITHUB_REPO_URL=$1
ECR_REPO_URL=$2

# Clone the GitHub repository
git clone $GITHUB_REPO_URL app
cd app

# Build the Docker image
docker build -t my-app:latest .

# Tag the image for ECR
docker tag my-app:latest $ECR_REPO_URL:latest

# Authenticate Docker to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REPO_URL

# Push the image to ECR
docker push $ECR_REPO_URL:latest

# Clean up
cd ..
rm -rf app
