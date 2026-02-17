#!/bin/bash
# run_daily.sh - Daily Digest Automation for substackprint.com workflow

# Navigate to the project directory
cd /Users/carson/Documents/R_Projects/dailydigest

# The SMTP_PASSWORD must be available to the script.
# You can uncomment and set it here, or ensure it's in your system ENV.
# export SMTP_PASSWORD="your_password_here"

# Run the legacy R script
# Using absolute path to Rscript for cron reliability
/usr/local/bin/Rscript daily_digest.R >> daily_digest.log 2>&1
