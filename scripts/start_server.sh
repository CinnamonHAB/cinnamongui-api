#!/bin/bash

STARTUP_DELAY="${STARTUP_DELAY:-10}"

echo "Starting server..."

echo "Sleeping for $STARTUP_DELAY seconds, waiting for the DB to start."
echo "You can adjust this by setting STARTUP_DELAY variable in env/api.env"

sleep "$STARTUP_DELAY"

SCRIPT_DIR=$(cd $(dirname "$0") && pwd)
APP_ROOT="$(cd "$SCRIPT_DIR/../" && pwd)"

pushd $APP_ROOT
  bundle check || bundle install

  bundle exec rails db:create
  bundle exec rails db:migrate
  bundle exec rake db:seed

  ps  -p "$(cat tmp/pids/server.pid)" > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "The server is already running"
  else
    rm -f tmp/pids/server.pid
    bundle exec rails s -b '0.0.0.0'
  fi
popd
