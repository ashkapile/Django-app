# This script is to run the jenkins locally

#!/bin/bash

# Create Docker volume for Jenkins data
docker volume create jenkins_data

# Run Jenkins container
# docker run -d \
#   --name jenkins \
#   -p 8080:8080 -p 50000:50000 \
#   -v jenkins_data:/var/jenkins_home \
#   jenkins/jenkins:lts

docker run -d \
  --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_data:/var/jenkins_home \
  jenkins-docker


