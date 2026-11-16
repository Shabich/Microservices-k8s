#!/usr/bin/env bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.11.2/deploy/static/provider/cloud/deploy.yaml

docker build -t client ./client
docker build -t posts ./posts
docker build -t comments ./comments
docker build -t query ./query
docker build -t moderation ./moderation
docker build -t event-bus ./event-bus

kubectl apply -f k8s/
