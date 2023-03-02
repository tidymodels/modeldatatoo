## code to prepare `ames` dataset goes here

library(modeldata)
library(janitor)

data("ames", package = "modeldata")

ames <- ames |>
  clean_names()

library(pins)

board <- board_folder("data-raw/", versioned = FALSE)

board |>
  pin_write(ames, "ames", type = "rds")
