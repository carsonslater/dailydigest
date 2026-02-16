# helpers/generate_digest_qmd.R

library(yaml)
library(here)
library(glue)
library(jsonlite)
library(lubridate)
library(stringr)

generate_digest_qmd <- function(config) {
    # 1. Setup paths
    repo_path <- here("substack2markdown_repo")
    data_dir <- file.path(repo_path, "data")
    output_qmd <- here("digest.qmd")

    # 2. Scrape each URL
    urls <- config$substack_urls
    # Also include detected URLs from profile if any (logic from daily_digest.R can be moved here)

    for (url in urls) {
        message(glue("Scraping {url}..."))
        # Run scraper (n=5 to be safe, filter by date later)
        # We use -n 5 to get a few recent posts to ensure we don't miss any within the threshold
        cmd <- glue("python3 substack_scraper.py -u {url} -n 5")
        system(glue("cd {repo_path} && {cmd}"))
    }

    # 3. Collect and filter posts
    all_posts <- list()
    json_files <- list.files(data_dir, pattern = "\\.json$", full.names = TRUE)

    threshold_date <- Sys.Date() - days((config$days_threshold %||% 3) - 1)

    for (jf in json_files) {
        data <- fromJSON(jf)
        author_name <- str_remove(basename(jf), "\\.json$")

        if (is.data.frame(data) && nrow(data) > 0) {
            for (i in seq_len(nrow(data))) {
                post <- data[i, ]
                # Date format in JSON: "Feb 15, 2026"
                post_date <- mdy(post$date)

                if (!is.na(post_date) && post_date >= threshold_date) {
                    # Read the markdown file
                    md_path <- file.path(repo_path, post$file_link)
                    if (file.exists(md_path)) {
                        content <- readLines(md_path, warn = FALSE)
                        content_clean <- paste(content, collapse = "\n")

                        all_posts[[length(all_posts) + 1]] <- list(
                            title = post$title,
                            author = author_name,
                            date = post$date,
                            content = content_clean
                        )
                    }
                }
            }
        }
    }

    if (length(all_posts) == 0) {
        stop("No posts found in the last ", config$days_threshold, " days.")
    }

    # 4. Generate the QMD file
    qmd_header <- glue("---
title: \"{config$newspaper_title %||% 'THE DAILY DIGEST'}\"
subtitle: \"All the news that fits in Markdown\"
date: \"{format(Sys.Date(), '%B %d, %Y')}\"
format:
  typst:
    template: themes/nyt.typ
    default-image-extension: jpg
---

")

    qmd_body <- ""
    for (post in all_posts) {
        qmd_body <- paste0(qmd_body, glue("
# {post$title}
*By {post$author} | {post$date}*

{post$content}

***

"))
    }

    writeLines(c(qmd_header, qmd_body), output_qmd)

    message(glue("Generated {output_qmd} with {length(all_posts)} posts."))
    return(output_qmd)
}
