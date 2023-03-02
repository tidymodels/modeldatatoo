## code to prepare `ames` dataset goes here

library(modeldata)
library(janitor)

data("ames", package = "modeldata")

ames <- ames |>
  clean_names()

readr::write_rds(ames, "data-raw/ames.rds")
