#' Detect Followed Substack Publications
#'
#' @param profile_url The URL of the user's Substack profile (e.g., https://substack.com/@username)
#' @return A vector of publication URLs
detect_subscriptions <- function(profile_url) {
  library(chromote)
  library(tidyverse)
  library(glue)

  if (is.null(profile_url) || profile_url == "" || profile_url == "https://substack.com/@yourusername") {
    message("No valid profile URL provided. Skipping automatic detection.")
    return(character(0))
  }

  message(glue("Navigating to profile: {profile_url}"))

  b <- ChromoteSession$new()

  # Navigate to the profile page
  b$Page$navigate(profile_url)
  b$Page$loadEventFired()

  # Wait for the page to render
  Sys.sleep(3)

  # Try to click the "Reads" tab to reveal publications
  # The tab text is "Reads"
  message("Attempting to click 'Reads' tab...")
  b$Runtime$evaluate("
    const tabs = Array.from(document.querySelectorAll('a, button'));
    const readsTab = tabs.find(t => t.textContent.trim() === 'Reads');
    if (readsTab) readsTab.click();
  ")

  # Wait for tab content to load - hydration can be slow
  Sys.sleep(10)

  js_code <- "document.body.innerHTML"
  html_content <- b$Runtime$evaluate(js_code)$result$value

  b$close()

  if (is.null(html_content)) {
    message("Failed to extract HTML content from page.")
    return(character(0))
  }

  # Extract all .substack.com links found in the HTML string
  # Pattern: https://[name].substack.com
  # Using a broader pattern to capture anything resembling a publication domain
  links <- str_extract_all(html_content, "https://[a-zA-Z0-9\\._-]+\\.substack\\.com")[[1]]

  if (length(links) == 0) {
    return(character(0))
  }

  # Filter links
  # Use exact hostname matches for system domains we want to skip
  exclude_regex <- "^https://(on|support|api|www|substack-native)\\.substack\\.com$"

  profile_name <- str_extract(profile_url, "(?<=@)[^/]+")

  subs <- links %>%
    unique() %>%
    # Clean trailing slashes
    map_chr(~ str_replace(.x, "/+$", "")) %>%
    # Keep only things that look like publication domains
    keep(~ str_detect(.x, "https://.*\\.substack\\.com")) %>%
    # Exclude the core substack domains using precise regex
    discard(~ str_detect(.x, exclude_regex)) %>%
    # Exclude the main home page
    discard(~ .x == "https://substack.com") %>%
    # Exclude profile handle publication if it's exactly the same as the user handle
    # (e.g. discard carsonslater.substack.com if profile is @carsonslater)
    # BUT keep others like honestinference.substack.com
    discard(~ !is.na(profile_name) && .x == glue("https://{profile_name}.substack.com")) %>%
    unique()

  message(glue("Detected {length(subs)} external subscriptions: {paste(subs, collapse = ', ')}"))

  return(subs)
}
