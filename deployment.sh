#!/bin/bash

# You can find the code here https://gitlab.com/secasp/container-exercise

# Create folder that will be used as MySQL data volume
mkdir database-data
# Access to python code application
cd python-code
# Build python-code image with ARGS
docker build --build-arg USER=group2_user --build-arg PASSWORD=password --build-arg DB_HOST=group2_mysql --build-arg DB_NAME=group2_db -t python-code .
# Pull MySQL image from DockerHub
docker pull mysql
# Create docker network, we decided to name it as our group
docker network create --driver bridge --subnet 172.18.0.0/16 group2-network
# Create local volume for database data
docker volume create -o device=/Users/harlook/Personal/containers-exercise/database-data -o type=tmpfs database-data
# Start MySQL container
docker run -d --name group2_mysql \
    -e MYSQL_DATABASE=group2_db \
    -e MYSQL_USER=group2_user \
    -e MYSQL_PASSWORD=password \
    -e MYSQL_ROOT_PASSWORD=password \
    -v database-data:/var/lib/mysql \
    --network group2-network \
    mysql
# Start python app container
docker run -d --name python-app \
    -p 8081:5000 \
    --mount type=bind,source=/Users/harlook/Personal/container-exercise/python-code,target=/app/ \
    --network group2-network \
    python-code