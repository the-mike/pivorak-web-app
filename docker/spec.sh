#!/bin/sh
sleep 5 && bundle exec rails db:create db:migrate db:test:prepare && bundle exec rspec
