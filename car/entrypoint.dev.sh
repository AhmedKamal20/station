#!/bin/bash
set -e

echo 'Installing Ruby Dependencies'
bundle check || bundle install

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
