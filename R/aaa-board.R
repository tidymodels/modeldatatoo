github_raw <- function(x) paste0("https://raw.githubusercontent.com/", x)

library(pins)

## with a named vector of URLs to specific pins:
b1 <- board_url(c(
  files = github_raw("rstudio/pins-r/main/tests/testthat/pin-files/"),
  rds = github_raw("rstudio/pins-r/main/tests/testthat/pin-rds/"),
  raw = github_raw("rstudio/pins-r/main/tests/testthat/pin-files/first.txt")
))

b1 %>% pin_read("rds")

b1 %>%
  pin_download("raw")

b1 <- board_url(c(
  ames = github_raw("emilhvitfeldt/modeldatatoo/main/data-raw/ames.rds")
))

b1 %>% pin_read("ames")

