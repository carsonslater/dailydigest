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

# 3. Generate the Quarto Digest
source(here("helpers", "generate_digest_qmd.R"))

# Ensure output directory exists
if (!dir.exists(config$output_dir)) {
  dir.create(config$output_dir)
}

# Update config with all subscribed URLs for the generator
config$substack_urls <- subscribed_urls

qmd_path <- generate_digest_qmd(config)

# 4. Render the PDF using Quarto and Typst
snapshot_ts <- format(Sys.Date(), "%Y%m%d")
pdf_filename <- glue("{snapshot_ts}_daily_digest.pdf")
pdf_path <- file.path(config$output_dir, pdf_filename)

# Clean up any existing PDF from today to avoid sending old content
if (file.exists(pdf_path)) {
  message("Removing existing PDF from today...")
  file.remove(pdf_path)
}

message("Rendering PDF with Quarto...")
# Use shQuote for paths and handle exit code
render_cmd <- glue("quarto render {shQuote(qmd_path)} --to typst --output {shQuote(pdf_filename)} -M keep-typ:true")
exit_code <- system(render_cmd)

if (exit_code != 0) {
  stop("Quarto render failed with exit code ", exit_code)
}

# Move PDF to output dir if it's not already there
generated_pdf <- here(pdf_filename)
if (file.exists(generated_pdf)) {
  file.rename(generated_pdf, pdf_path)
}

if (!file.exists(pdf_path)) {
  stop("Failed to find generated PDF at: ", pdf_path)
}

# 5. Send the email and cleanup
source(here("helpers", "email_sender.R"))
send_newspaper_email(pdf_path, config)

# Cleanup
# if (file.exists(pdf_path)) {
#   message("Deleting PDF as requested...")
#   file.remove(pdf_path)
# }

# if (file.exists(qmd_path)) {
#   file.remove(qmd_path)
# }

message("Done! Daily digest complete.")
