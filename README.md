# openIMIS dockerized database

| :bomb: Disclaimer : NOT FOR PRODUCTION USE :bomb: |
| --- |
| This repository provides a dockerized openIMIS database. It provides a quick setup for development, testing or demoing. ***It is NOT INTENDED FOR PRODUCTION USE.*** |

Please look for the directions on the openIMIS Wiki: https://openimis.atlassian.net/wiki/spaces/OP/pages/963182705/MO1.1+Install+the+modular+openIMIS+using+Docker

Using the provided docker file, you can build a docker image running a SQL Server 2017, with a restored openIMIS backup database.
This is done by giving the following ARGs to the docker build command:
```
docker build \
  --build-arg ACCEPT_EULA=Y \
  --build-arg SA_PASSWORD=<your secret password> \
  . \
  -t openimis-db
```

optinnaly 
```
--build-arg SQL_SCRIPT_URL=<url to the sql script to create the database> \
  --build-arg DB_USER_PASSWORD=StrongPassword
  --build-arg DB_USER=IMISUser
  --build-arg DB_NAME=IMIS
```
***Notes***:
* by setting the ACCEPT_EULA=Y, you explicitely accept [Microsoft EULA](https://go.microsoft.com/fwlink/?linkid=857698) for the dockerized SQL Server 2017. Please ensure you read it and use the provided software according to the terms of that license.
* choose a strong password (at least 8 chars,...)... or SQL Server will complain


To start the image in a docker container: `docker run -p 1433:1433 openimis-db`
To restore the backup inside the container:
* To spot the ID of the container: `docker container ls` (spot the row with openimis-db IMAGE name)


***Note:***
the container will check if the database exist, if it doesnot it will take the latest demo release version and deploy it , SQL_SCRIPT_URL is per defautl set to "https://github.com/openimis/database_ms_sqlserver/releases/latest/download/sql-files.zip"
to have data retention when container are recreated volums need to be configured as microsoft docs suggest
* <host directory>/data:/var/opt/mssql/data : database files
* <host directory>/log:/var/opt/mssql/log : logs files
* <host directory>/secrets:/var/opt/mssql/secrets : secrets

The database is writen within the container. If you want to keep your data between container execution, stop/start the container via `docker stop <CONTAINER ID>` / `docker start <CONTAINER ID>` (using `docker run ... ` recreates a new container from the image... thus without any data)
