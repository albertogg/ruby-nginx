#! /usr/bin/env bash

export LANG=en_US.utf8
export LC_CTYPE=en_US.UTF-8

BUNDLE="/usr/local/rbenv/shims/bundle"
RAKE="/usr/local/rbenv/shims/rake"

TZ='America/Caracas' date >> /var/www/logs/cron-build.log
cd /var/www/codehero-jekyll/current && $BUNDLE exec $RAKE server >> /var/www/logs/cron-build.log 2>&1
