## code to prepare `ames` dataset goes here

library(modeldata)
library(janitor)

data("ames", package = "modeldata")

ames <- ames |>
  clean_names()

library(pins)
library(here)

board <- board_folder(here("pkgdown/assets/pins-board"), versioned = FALSE)
board |> pin_write(ames, "ames", type = "rds")
board |> write_board_manifest()
