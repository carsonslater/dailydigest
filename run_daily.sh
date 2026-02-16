#!/bin/bash
# run_daily.sh

# Navigate to the project directory
cd /Users/carson/Documents/R_Projects/dailydigest

# Export the SMTP password (ensure this matches your environment)
# You can also source a .env file if you prefer
# export SMTP_PASSWORD="your_password_here"

# Run the R script
/usr/local/bin/Rscript daily_digest.R >> daily_digest.log 2>&1
