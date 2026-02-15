#' Send Newspaper PDF via Email
#'
#' @param pdf_path Path to the PDF file
#' @param config Configuration list containing email settings
send_newspaper_email <- function(pdf_path, config) {
  library(blastula)
  library(glue)

  message("Composing email...")
  
  # Create the email object
  email_obj <- compose_email(
    body = md(glue("
Howdy,

Here is your favorite Substack writer's latest work, delivered as a newspaper PDF.

Enjoy your reading!

Best,
Daily Digest Bot
    ")),
    footer = md(glue("Generated via substackprint.com and R automation."))
  )
  
  # Add the attachment
  email_obj <- add_attachment(email_obj, file = pdf_path)

  message("Sending email to: ", config$email$to)
  
  tryCatch({
    smtp_send(
      email = email_obj,
      from = config$email$from,
      to = config$email$to,
      subject = config$email$subject,
      credentials = creds_envvar(
        user = config$email$smtp_user,
        pass_envvar = config$email$pass_envvar,
        provider = config$email$smtp_provider
      )
    )
    message("✓ SUCCESS: Email sent.")
  }, error = function(e) {
    message("✗ ERROR: ", e$message)
    stop(e)
  })
}
