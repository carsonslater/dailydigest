# daily_digest.R

library(tidyverse)
library(yaml)
library(xml2)
library(here)
library(glue)
library(lubridate)

# 1. Load Configuration
config_path <- here("config.yml")
if (!file.exists(config_path)) {
  stop("config.yml not found. Please create it from the example.")
}
config <- yaml::read_yaml(config_path)

# 2. Get Subscribed URLs (Automatic, Manual, or OPML)
source(here("helpers", "subscription_detector.R"))

# Start with manual list
subscribed_urls <- config$substack_urls

# Add from Profile if profile_url is set
if (!is.null(config$profile_url) && config$profile_url != "") {
  detected_urls <- detect_subscriptions(config$profile_url)
  subscribed_urls <- c(subscribed_urls, detected_urls)
}

# Add from OPML if file exists
opml_path <- here(config$opml_file %||% "substack_subscriptions.opml")
if (file.exists(opml_path)) {
  message(glue("Importing subscriptions from OPML: {basename(opml_path)}"))
  try({
    opml <- read_xml(opml_path)
    opml_links <- xml_find_all(opml, "//outline[@type='rss']") %>%
      xml_attr("htmlUrl") %>%
      keep(~ !is.na(.x))
    subscribed_urls <- c(subscribed_urls, opml_links)
  })
}

subscribed_urls <- unique(subscribed_urls)

if (length(subscribed_urls) == 0) {
  stop("No Substack URLs found to process. Please set profile_url, substack_urls, or provide an OPML file.")
}

# 3. Fetch all posts from the last X days
all_post_urls <- c()
threshold_days <- config$days_threshold %||% 3
threshold_date <- Sys.time() - days(threshold_days)

for (url in subscribed_urls) {
  message(glue("Processing {url}..."))
  rss_url <- paste0(str_replace_all(url, "/+$", ""), "/feed")

  tryCatch(
    {
      rss <- read_xml(rss_url)
      items <- xml_find_all(rss, ".//item")

      if (length(items) > 0) {
        count <- 0
        for (item in items) {
          pub_date_str <- xml_text(xml_find_first(item, ".//pubDate"))
          # Substack RSS format: "Fri, 13 Feb 2026 12:00:00 GMT"
          # lubridate's parse_date_time is robust if we specify the main components
          pub_date <- parse_date_time(pub_date_str, "a d b Y H M S")

          if (!is.na(pub_date) && pub_date >= threshold_date) {
            post_title <- xml_text(xml_find_first(item, ".//title"))
            post_link <- xml_text(xml_find_first(item, ".//link"))
            all_post_urls <- c(all_post_urls, post_link)
            count <- count + 1
            message(glue("  + Found: '{post_title}' ({format(pub_date, '%b %d')})"))
          }
        }
        if (count == 0) message(glue("  No posts in the last {threshold_days} days."))
      } else {
        message(glue("  No posts found in feed for {url}"))
      }
    },
    error = function(e) {
      message(glue("  Error fetching {url}: {e$message}"))
    }
  )
}

if (length(all_post_urls) == 0) {
  stop("No posts found from the last ", threshold_days, " days across all subscriptions.")
}

# 4. Generate the PDF
source(here("helpers", "pdf_generator.R"))

# Ensure output directory exists
if (!dir.exists(config$output_dir)) {
  dir.create(config$output_dir)
}

if (length(all_post_urls) > 15) {
  message(glue("WARNING: Found {length(all_post_urls)} posts. substackprint.com works best with <15 articles. Some content may be heavy."))
}

snapshot_ts <- format(Sys.Date(), "%Y%m%d")
pdf_filename <- glue("{snapshot_ts}_daily_digest.pdf")
pdf_path <- here(config$output_dir, pdf_filename)

generate_newspaper_pdf(all_post_urls, pdf_path, title = config$newspaper_title)

# 5. Send the email
source(here("helpers", "email_sender.R"))
send_newspaper_email(pdf_path, config)

message("Done! Daily digest complete.")
