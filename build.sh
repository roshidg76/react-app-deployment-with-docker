#!/bin/bash

#login into DockerHub:
docker login -u $DOCKER_USERNAME -p $DOCKER_PASS

#stopping existing container:
docker stop react || true
docker rm react || true

#building a image:
docker build -t react-ci/cd .

#running a container from the created image:
docker run -d --name react -p 80:80 react-ci/cd

#pushing the image to dockerhub:
docker tag react-ci/cd roshid76/react-app:ci-cd
docker push roshid76/react-app:ci-cd
