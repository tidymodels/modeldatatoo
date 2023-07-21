library(pins)
library(here)

pharma_bioreactors <- load("data-raw/pharma_bioreactors/pharma_bioreactors.RData")

board <- board_folder(here("pkgdown/assets/pins-board"), versioned = FALSE)
board |> pin_write(pharma_bioreactors, "pharma_bioreactors", type = "rds")
board |> write_board_manifest()
