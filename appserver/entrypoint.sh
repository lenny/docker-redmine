#!/bin/bash

set -e

cd $REDMINE_DIR

RAILS_ENV=production rake db:migrate

cat $REDMINE_DIR/config/configuration.yml.template | sed "s/REDMINE_EMAIL_PASSWORD/${REDMINE_EMAIL_PASSWORD}/g" > $REDMINE_DIR/config/configuration.yml

exec unicorn_rails -c unicorn.rb -p 3000 -E production