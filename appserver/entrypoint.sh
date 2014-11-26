#!/bin/bash

set -e

cd $REDMINE_DIR

RAILS_ENV=production rake db:migrate

exec unicorn_rails -c unicorn.rb -p 3000 -E production