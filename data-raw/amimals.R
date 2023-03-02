## code to prepare `amimals` dataset goes here

library(animals)

animals <- animals_raw

library(pins)

board <- board_folder("data-raw/", versioned = FALSE)

board |>
  pin_write(animals, "animals", type = "rds")
