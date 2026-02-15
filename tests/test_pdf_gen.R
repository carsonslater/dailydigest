# tests/test_pdf_gen.R
library(here)

source(here("helpers", "pdf_generator.R"))

# Test with a public Substack post
test_url <- "https://rawandferal.substack.com/p/the-substack-print"
output_file <- here("output", "test_verification.pdf")

if (!dir.exists(here("output"))) {
  dir.create(here("output"))
}

message("Starting PDF generation test...")
result <- tryCatch({
  generate_newspaper_pdf(test_url, output_file)
  TRUE
}, error = function(e) {
  message("FAILED: ", e$message)
  FALSE
})

if (result) {
  if (file.exists(output_file) && file.size(output_file) > 1000) {
    message("✓ SUCCESS: PDF generated and verified.")
  } else {
    message("✗ FAILURE: PDF file missing or too small.")
  }
}
