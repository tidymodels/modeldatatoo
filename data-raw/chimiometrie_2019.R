## code to prepare `chimiometrie_2019` dataset goes here

# https://www.dropbox.com/s/cinfrxsj2l6ljr0/chimiometrie_2019.RData?dl=0
load("~/Downloads/chimiometrie_2019.rdata")

library(janitor)
chimiometrie_2019 <- clean_names(chimiometrie_2019)

library(pins)
library(here)

board <- board_folder(here("pkgdown/assets/pins-board"), versioned = FALSE)
board |> pin_write(chimiometrie_2019, "chimiometrie_2019", type = "rds")
board |> write_board_manifest()
