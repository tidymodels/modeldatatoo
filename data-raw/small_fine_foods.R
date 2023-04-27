## code to prepare `small_fine_foods` dataset goes here

data("small_fine_foods", package = "modeldata")

# Should be a named list
small_fine_foods <- list(training_data = training_data, testing_data = testing_data)

library(pins)
library(here)

board <- board_folder(here("pkgdown/assets/pins-board"), versioned = FALSE)
board |> pin_write(small_fine_foods, "small_fine_foods", type = "rds")
board |> write_board_manifest()
