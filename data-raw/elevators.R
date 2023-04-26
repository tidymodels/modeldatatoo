## code to prepare `elevators` dataset goes here

library(elevators)
library(janitor)

data("elevators", package = "elevators")

library(pins)
library(here)

board <- board_folder(here("pkgdown/assets/pins-board"), versioned = FALSE)
board |> pin_write(elevators, "elevator", type = "rds")
board |> write_board_manifest()
