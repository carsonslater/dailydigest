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

# 2. Detect Subscriptions (Automatic or Manual)
source(here("helpers", "subscription_detector.R"))
detected_urls <- detect_subscriptions(config$profile_url)

# Merge detected with manual list, keeping unique
subscribed_urls <- unique(c(detected_urls, config$substack_urls))

if (length(subscribed_urls) == 0) {
  stop("No Substack URLs found to process. Please set profile_url or substack_urls in config.yml.")
}

# 3. Fetch latest posts from all detected Substacks
all_post_urls <- c()

for (url in subscribed_urls) {
  message(glue("Fetching latest post from {url}..."))
  rss_url <- paste0(url, config$rss_path) %>% str_replace_all("/+$", "") %>% paste0("/feed")
  
  tryCatch({
    rss <- read_xml(rss_url)
    items <- xml_find_all(rss, ".//item")
    
    if (length(items) > 0) {
      latest_item <- items[1]
      post_title <- xml_text(xml_find_first(latest_item, ".//title"))
      post_link <- xml_text(xml_find_first(latest_item, ".//link"))
      
      message(glue("  Found: '{post_title}'"))
      all_post_urls <- c(all_post_urls, post_link)
    } else {
      message(glue("  No posts found for {url}"))
    }
  }, error = function(e) {
    message(glue("  Error fetching {url}: {e$message}"))
  })
}

if (length(all_post_urls) == 0) {
  stop("No posts found in any of the RSS feeds.")
}

# 4. Generate the PDF
source(here("helpers", "pdf_generator.R"))

# Ensure output directory exists
if (!dir.exists(config$output_dir)) {
  dir.create(config$output_dir)
}

snapshot_ts <- format(Sys.Date(), "%Y%m%d")
pdf_filename <- glue("{snapshot_ts}_daily_digest.pdf")
pdf_path <- here(config$output_dir, pdf_filename)

generate_newspaper_pdf(all_post_urls, pdf_path, title = config$newspaper_title)

# 5. Send the email
source(here("helpers", "email_sender.R"))
send_newspaper_email(pdf_path, config)

message("Done! Daily digest complete.")
