#!/bin/bash
set -e

# Export environment variables to a file that cron can source
# This is crucial because cron runs in a limited environment and won't see
# variables passed to `docker run -e ...` by default.
printenv > /etc/environment

# Start cron in the foreground
echo "Starting cron..."
cron -f
