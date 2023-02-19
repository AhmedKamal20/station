#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

echo 'Installing Ruby Dependencies'
bundle check || bundle install

rails log:clear
rails tmp:clear

# Do the pending migrations.
if psql -lqt | cut -d \| -f 1 | grep -qw app_development; then
  rails db:migrate
elif [[ -f 'db/schema.rb' ]]; then
  rails db:setup
else
  rails db:create db:migrate db:seed
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
