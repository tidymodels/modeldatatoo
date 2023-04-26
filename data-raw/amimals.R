## code to prepare `amimals` dataset goes here

library(animals)

animals <- animals_raw

library(pins)
library(here)

board <- board_folder(here("pkgdown/assets/pins-board"), versioned = FALSE)
board |> pin_write(animals, "animals", type = "rds")
board |> write_board_manifest()
