# remotes::install_github("simonpcouch/detectors@v0.0.1")

library(detectors)

library(pins)
library(here)

board <- board_folder(here("pkgdown/assets/pins-board"), versioned = FALSE)
board |> pin_write(detectors, "detectors", type = "rds")
board |> write_board_manifest()

