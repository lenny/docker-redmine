#!/bin/bash

set -v

REDMINE_EMAIL_PASSWORD=
MYSQL_ROOT_PWD=
TAG=1.0

# See https://registry.hub.docker.com/_/mysql/
docker run --name redminedb -v /data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PWD -e MYSQL_DATABASE=redmine -e MYSQL_USER=redmine -e MYSQL_PASSWORD=redmine -d mysql:5.6
docker run -d --link redminedb:db --name redmine-appserver -e REDMINE_EMAIL_PASSWORD=$REDMINE_EMAIL_PASSWORD lmarks/redmine-appserver:${TAG}
docker run -d --name redmine-frontend --link redmine-appserver:appserver --volumes-from redmine-appserver -v /data/certs:/etc/nginx/certs -p 80:80 -p 443:443 lmarks/redmine-frontend:${TAG}

