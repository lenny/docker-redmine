docker-redmine
==============

My Docker Containerized Redmine Install

## Mysql

See https://registry.hub.docker.com/_/mysql/

    docker run --name redminedb -v /data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=<password> -e MYSQL_DATABASE=redmine -e MYSQL_USER=redmine -e MYSQL_PASSWORD=redmine -d mysql:5.6

## Redmine Rails Appserver

    docker run -d --link redminedb:db --name redmine-appserver -p 3000:3000 redmine-appserver

## Nginx Frontend

docker run -d --name redmine-frontend --link redmine-appserver:appserver --volumes-from redmine-appserver -v /data/certs:/etc/nginx/certs -p 80:80 -p 443:443 lmarks/redmine-frontend

