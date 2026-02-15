#' Generate Newspaper PDF from Substack URL(s)
#'
#' @param post_urls A vector of URLs of the Substack posts
#' @param output_path Where to save the generated PDF
#' @param title Optional title for the newspaper (multi-mode only)
#' @return Path to the generated PDF
generate_newspaper_pdf <- function(post_urls, output_path, title = NULL) {
  library(chromote)
  library(glue)

  # Initialize chromote
  b <- ChromoteSession$new()
  
  # Set a desktop viewport
  b$Emulation$setDeviceMetricsOverride(
    width = 1920,
    height = 1080,
    deviceScaleFactor = 1,
    mobile = FALSE
  )

  message("Navigating to substackprint.com...")
  b$Page$navigate("https://substackprint.com/")
  b$Page$loadEventFired()
  
  Sys.sleep(3) 

  if (length(post_urls) > 1) {
    message("Switching to Multi-Publication mode...")
    # Click the radio button
    b$Runtime$evaluate("document.getElementById('pub-mode-multi').click();")
    
    # Enter the URLs (newline separated)
    urls_string <- paste(post_urls, collapse = "\n")
    b$Runtime$evaluate(glue(
      "document.getElementById('substack-urls').value = `{urls_string}`;"
    ))
    
    # Optional Title
    if (!is.null(title)) {
      message(glue("Setting title to: {title}"))
      b$Runtime$evaluate(glue(
        "document.getElementById('multi-newspaper-title').value = '{title}';"
      ))
    }
  } else {
    message(glue("One URL detected: {post_urls[1]}"))
    b$Runtime$evaluate(glue(
      "document.getElementById('substack-url').value = '{post_urls[1]}';"
    ))
  }
  
  # Click the "Go Analog!" button
  b$Runtime$evaluate("document.querySelector('#substack-form button[type=\"submit\"]').click();")
  
  message("Waiting for newspaper generation (this can take a while for multiple URLs)...")
  
  # Simple polling for simplicity in R
  max_wait <- 60 # Increased timeout for multi-mode
  wait_interval <- 1
  elapsed <- 0
  generated <- FALSE
  
  while(elapsed < max_wait) {
    res <- b$Runtime$evaluate("!document.getElementById('newsletter-container').classList.contains('hidden') && document.getElementById('newsletter').children.length > 0")
    if (res$result$value == TRUE) {
      generated <- TRUE
      break
    }
    Sys.sleep(wait_interval)
    elapsed <- elapsed + wait_interval
  }
  
  if (!generated) {
    b$close()
    stop("Timed out waiting for newspaper generation.")
  }
  
  # Wait for images to load
  Sys.sleep(5)
  
  message("Printing to PDF...")
  pdf_data <- b$Page$printToPDF(
    printBackground = TRUE,
    marginTop = 0,
    marginBottom = 0,
    marginLeft = 0,
    marginRight = 0
  )
  
  # Write the binary data to file
  writeBin(jsonlite::base64_dec(pdf_data$data), output_path)
  
  b$close()
  message(glue("PDF saved to: {output_path}"))
  
  return(output_path)
}
