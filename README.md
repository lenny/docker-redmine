docker-redmine
==============

My Docker Containerized Redmine Install

## Container Host Setup

### Install docker on vhost (once)

### Setup persistent volumes (once)

* /data/mysql - From backup
* /data/certs - See appserver/nginx.conf

### Install up/down scripts

e.g. paste into /redmine/up.sh and /redmine/down.sh

## Start stack

    /redmine/up.sh

## Stop stack

    /redmine/down.sh


