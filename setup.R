# setup.R
# Run this script to install necessary dependencies

required_packages <- c(
  "tidyverse",
  "chromote",
  "blastula",
  "yaml",
  "xml2",
  "glue",
  "here",
  "lubridate"
)

new_packages <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]

if(length(new_packages)) {
  install.packages(new_packages)
}

message("Setup complete. All required packages are installed.")
