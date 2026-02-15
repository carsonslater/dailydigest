#' Detect Followed Substack Publications
#'
#' @param profile_url The URL of the user's Substack profile (e.g., https://substack.com/@username)
#' @return A vector of publication URLs
detect_subscriptions <- function(profile_url) {
  library(chromote)
  library(tidyverse)
  
  if (is.null(profile_url) || profile_url == "" || profile_url == "https://substack.com/@yourusername") {
    message("No valid profile URL provided. Skipping automatic detection.")
    return(character(0))
  }

  message(glue("Navigating to profile: {profile_url}"))
  
  b <- ChromoteSession$new()
  
  # Navigate to the profile page
  b$Page$navigate(profile_url)
  b$Page$loadEventFired()
  
  # Substack profiles list subscriptions under "Reads" or in the sidebar.
  # We'll look for links to .substack.com domains.
  
  # Wait for the page to render
  Sys.sleep(3)
  
  # Extract all links
  res <- b$Runtime$evaluate("Array.from(document.querySelectorAll('a')).map(a => a.href)")
  links <- res$result$value
  
  b$close()
  
  # Filter links to find Substack publications
  # Valid links are usually like: https://name.substack.com/
  # We exclude the main substack.com links and profile links
  subs <- links %>%
    keep(~ str_detect(.x, "https://.*\\.substack\\.com/?$")) %>%
    keep(~ !str_detect(.x, "https://(www\\.)?substack\\.com")) %>%
    unique()
  
  message(glue("Detected {length(subs)} subscriptions: {paste(subs, collapse = ', ')}"))
  
  return(subs)
}
