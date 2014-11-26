#!/bin/bash
set -e

cat /tmp/redmine.conf.template | sed "s/APPSERVER_PORT_3000_TCP_ADDR/${APPSERVER_PORT_3000_TCP_ADDR}/g" | \
   sed "s/APPSERVER_PORT_3000_TCP_PORT/${APPSERVER_PORT_3000_TCP_PORT}/g" | \
   sed "s:APPSERVER_ENV_REDMINE_DIR:${APPSERVER_ENV_REDMINE_DIR}:g" > /etc/nginx/sites-available/redmine

rm /etc/nginx/sites-enabled/default

ln -s /etc/nginx/sites-available/redmine /etc/nginx/sites-enabled/redmine

exec nginx