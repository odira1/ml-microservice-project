#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=odira/ml-microservice:latest

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create ns ml-microservices
kubectl create deployment ml-microservice --image=${dockerpath} -n ml-microservices

# Step 3:
# List kubernetes pods
kubectl get pods -n ml-microservices -o wide

# Step 4:
# Forward the container port to a host
kubectl expose deployment ml-microservice --type=NodePort \
    --name=ml-microservice-svc -n ml-microservices --port=80
