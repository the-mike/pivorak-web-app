#!/bin/sh
set -e

export PGPASSWORD=${POSTGRES_PASSWORD}

until echo "select 1" | psql --host $POSTGRES_HOST --username $POSTGRES_USER --quiet --no-align --tuples-only &> /dev/null; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
bundle exec rails db:create db:migrate db:test:prepare && bundle exec rspec
