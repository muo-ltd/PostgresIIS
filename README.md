# Postgres IIS

Import IIS logs into an instance of Postgres running under docker.

## How to use it 

Drop your IIS log into the src/logstoload directory. Currently it will only support one log at a time
and it must be named 

input.log

The run:

docker-compose build 

then

docker-compose up -d 

An instance of Postgres will then be running on docker with port 5432 mapped to the host.
You can then connect to it using PgAdmin or other tools to query the data. The password 
for the postgres user is Password1. 

