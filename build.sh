#!/usr/bin/env bash

docker build . -t awscli-terraform

docker tag awscli-terraform artronics/awscli-terraform:latest
docker tag awscli-terraform artronics/awscli-terraform:0.12.15

docker push artronics/awscli-terraform:latest
docker push artronics/awscli-terraform:0.12.15
