#!/bin/bash

docker kill $(docker ps -q) # Stop all containers

docker image prune # Remove all images from OS

docker container prune # Remove all tangling containers from OS

docker volume prune # Remove all volumes from OS

docker network prune # Remove all nerworks from OS

docker system prune # Remove all Docker's unused objects/data from OS
