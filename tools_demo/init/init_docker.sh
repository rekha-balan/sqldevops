#!/bin/bash



docker pull microsoft/mssql-server-linux:latest
docker pull postgres:latest
docker images


docker run --name sqldevops -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Yukon900' \
-p 1433:1433 -v /Users/erickang/dockershare:/backups  -d microsoft/mssql-server-linux  

docker run --name postgres -e POSTGRES_USER=sa -e POSTGRES_PASSWORD=Yukon900 \
-p 5432:5432 --restart=always -d postgres

docker ps