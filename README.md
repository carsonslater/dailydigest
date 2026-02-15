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

## Credits
- Layout tool: [substackprint.com](https://substackprint.com) by [raw & feral](https://rawandferal.substack.com).
- Automation: Built with R, `chromote`, and `blastula`.
