#!/bin/bash

set -v

docker stop redmine-frontend
docker rm redmine-frontend
docker stop redmine-appserver
docker rm redmine-appserver
docker stop redminedb
docker rm redminedb