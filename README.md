# Substack Daily Newspaper Automation

This project automates the creation of a newspaper-style PDF from your favorite Substack writer's latest post and emails it to you. It leverages `substackprint.com` for the layout and `blastula` for email delivery.

## Project Structure

```
├── helpers/
│   ├── pdf_generator.R    # Automates substackprint.com using chromote
│   └── email_sender.R     # Sends PDF via blastula
├── output/                # (Created automatically) Stores generated PDFs
├── scripts/
│   └── daily_digest.R     # Main automation script
├── config.yml             # Your settings
├── setup.R                # Dependency installer
└── README.md
```

## Setup Instructions

1. **Install Dependencies**
   Run the setup script to install necessary R packages:
   ```r
   source("setup.R")
   ```

2. **Configuration**
   Edit `config.yml` with your favorite Substack URL and your email details.

3. **SMTP Credentials**
   The script uses `SMTP_PASSWORD` environment variable for your Gmail App Password. You can set it in your `.Renviron` file:
   ```
   SMTP_PASSWORD="your-app-password"
   ```

4. **Test the Workflow**
   Run the main script manually:
   ```r
   source("daily_digest.R")
   ```

## Cron Task Deployment

To run this daily at 8:00 AM, add a line to your crontab (`crontab -e`):

```bash
0 8 * * * /usr/local/bin/Rscript /path/to/dailydigest/daily_digest.R >> /path/to/dailydigest/cron.log 2>&1
```

*(Note: Adjust the path to `Rscript` and your project directory accordingly.)*

## Docker Deployment (Recommended)
This project is containerized to run daily at **6:30 AM** automatically.

### 1. Build the Image
```bash
docker build . -t daily-digest
```

### 2. Run the Container
Run the container in the background. You need to provide your SMTP password and mount the output directory.

```bash
docker run -d \
  --name my-daily-digest \
  -e SMTP_PASSWORD="your_google_app_password" \
  -v $(pwd)/output:/app/output \
  daily-digest
```

> **Note for Apple Silicon Users**: You may see a warning about platform mismatch (`linux/amd64`). This is expected and necessary for Google Chrome compatibility.

### 3. Verify
Check if it's running:
```bash
docker ps
```
(Status should be `Up ...`)

Trigger a manual run to test immediately:
```bash
docker exec my-daily-digest Rscript /app/daily_digest.R
```

### 4. Requirements for Daily Run
- Your computer must be **awake** at 6:30 AM.
- Docker Desktop must be running.

## Credits
- Layout tool: [substackprint.com](https://substackprint.com) by [raw & feral](https://rawandferal.substack.com).
- Automation: Built with R, `chromote`, and `blastula`.
