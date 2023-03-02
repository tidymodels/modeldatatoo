## code to prepare `elevators` dataset goes here

library(elevators)
library(janitor)

data("elevators", package = "elevators")

readr::write_rds(elevators, "data-raw/elevators.rds")
