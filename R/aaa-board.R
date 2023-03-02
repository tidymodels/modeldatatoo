github_raw <- function(x) paste0("https://raw.githubusercontent.com/", x)

modeldatatoo_board <- pins::board_url(c(
  ames = github_raw("tidymodels/modeldatatoo/main/data-raw/ames/20230302T001820Z-c271b/"),
  elevators = github_raw("tidymodels/modeldatatoo/main/data-raw/elevators/20230302T002412Z-8e16a/")
))
