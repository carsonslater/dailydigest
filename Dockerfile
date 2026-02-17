# Base image with R and Tidyverse (Force AMD64 for Google Chrome compatibility)
FROM --platform=linux/amd64 rocker/tidyverse:latest

# Install system dependencies for Chromium, Blastula, and R packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    zlib1g-dev \
    libfontconfig1 \
    libxt6 \
    libxt6 \
    cron \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Install Google Chrome for Chromote
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
    && apt-get update && apt-get install -y \
    google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the project files
COPY . .

# Install R dependencies
RUN Rscript setup.R

# Setup Cron
COPY crontab /etc/cron.d/daily-digest-cron
RUN chmod 0644 /etc/cron.d/daily-digest-cron && \
    crontab /etc/cron.d/daily-digest-cron && \
    touch /var/log/cron.log

# Set environment variable for Chromote to find Chrome
ENV CHROMOTE_CHROME=/usr/bin/google-chrome-stable

# Set Timezone (Default to Chicago/Central, can be overridden with -e TZ=...)
ENV TZ="America/Chicago"

# Use entrypoint script to handle environment variables for cron
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Run cron in foreground
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
