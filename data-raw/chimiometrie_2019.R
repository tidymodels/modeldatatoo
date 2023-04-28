# ------------------------------------------------------------------------------
## code to prepare `chimiometrie_2019` dataset goes here

# ------------------------------------------------------------------------------

library(tidyverse)
library(recipes)
library(pins)
library(here)

# ------------------------------------------------------------------------------
# Requires files from https://chemom2019.sciencesconf.org/resource/page/id/13.html

link <- "https://chemom2019.sciencesconf.org/data/challenge_chimiometrie2019.zip"

dest <- file.path(tempdir(), "chem.zip")
new_dir <- file.path(tempdir(), "chem_data")
dir.create(new_dir)

download.file(link, dest)
unzip(dest, exdir = new_dir)

list.files(new_dir)

# ------------------------------------------------------------------------------

chimiometrie_2019_spectra <-
  read_delim(file.path(new_dir, "XCAL.CSV"),
             delim = ";",
             col_names = FALSE) %>%
  set_names(recipes::names0(550, "wvlgth_"))
attr(chimiometrie_2019_spectra, "spec") <- NULL

chimiometrie_2019_spectra_val <-
  read_delim(file.path(new_dir, "XVAL.CSV"),
             delim = ";",
             col_names = FALSE) %>%
  set_names(recipes::names0(550, "wvlgth_"))
attr(chimiometrie_2019_spectra_val, "spec") <- NULL

chimiometrie_2019_outcomes <-
  read_delim(file.path(new_dir, "YCAL.CSV"),
             delim = ";", col_names = FALSE) %>%
  set_names(c("soy_oil", "lucerne", "barley"))
attr(chimiometrie_2019_outcomes, "spec") <- NULL

chimiometrie_2019 <-
  bind_cols(chimiometrie_2019_outcomes, chimiometrie_2019_spectra)

# ------------------------------------------------------------------------------

board <- board_folder(here("pkgdown/assets/pins-board"), versioned = FALSE)
board |> pin_write(chimiometrie_2019, "chimiometrie_2019", type = "rds")
board |> write_board_manifest()
