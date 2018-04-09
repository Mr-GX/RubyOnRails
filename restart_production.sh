#!/bin/bash
source ~/.bash_profile
DIR=/disk1/talenkr/production
cd $DIR
bundle install
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake assets:precompile
sudo /opt/nginx/sbin/nginx -s reload