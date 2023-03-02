## code to prepare `elevators` dataset goes here

library(elevators)
library(janitor)

data("elevators", package = "elevators")

library(pins)

board <- board_folder("data-raw/", versioned = FALSE)

board |>
  pin_write(elevators, "elevators", type = "rds")
