#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=odira/ml-microservice

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login -u odira -p $DOCKER_PASSWORD
docker image tag odira/ml-microservice:latest odira/ml-microservice:latest

# Step 3:
# Push image to a docker repository
docker image push odira/ml-microservice:latest
