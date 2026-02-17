# Base image with R and Tidyverse
FROM rocker/tidyverse:latest

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
    && rm -rf /var/lib/apt/lists/*

# Install Google Chrome for Chromote
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/勁/ debian main" >> /etc/apt/sources.list.d/google-chrome.list' \
    && apt-get update && apt-get install -y \
    google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the project files
COPY . .

# Install R dependencies
RUN Rscript setup.R

# Set environment variable for Chromote to find Chrome
ENV CHROMOTE_CHROME=/usr/bin/google-chrome-stable

# Command to run the digest
CMD ["Rscript", "daily_digest.R"]
