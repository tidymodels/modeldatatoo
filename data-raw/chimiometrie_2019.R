## code to prepare `chimiometrie_2019` dataset goes here

chimiometrie_2019 <- ...

library(janitor)
chimiometrie_2019 <- clean_names(chimiometrie_2019)

library(pins)
library(here)

board <- board_folder(here("pkgdown/assets/pins-board"), versioned = FALSE)
board |> pin_write(chimiometrie_2019, "chimiometrie_2019", type = "rds")
board |> write_board_manifest()
