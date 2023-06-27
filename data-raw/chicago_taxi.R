## code to prepare `chicago_taxi` dataset goes here

library(tidyverse)
library(tidymodels)
library(janitor)

# https://data.cityofchicago.org/Transportation/Taxi-Trips-2022/npd7-ywjz
taxi_raw <- read_csv("~/Downloads/Taxi_Trips_-_2022.csv") |>
  clean_names()

set.seed(1234)

taxi_med <- taxi_raw |>
  slice_sample(n = 10000) |>
  mutate(
    tip = if_else(tips > 0, "yes", "no") |> factor(levels = c("yes", "no")),
    trip_start = mdy_hms(trip_start_timestamp),
    local_trip = if_else(pickup_community_area == dropoff_community_area, "yes", "no") |>
      factor(levels = c("yes", "no")),
    pickup_community_area = factor(pickup_community_area),
    dropoff_community_area = factor(dropoff_community_area)
  )

taxi_rec_base <- recipe(tip ~ ., data = taxi_med) %>%
  step_date(trip_start, features = c("dow", "month"), keep_original_cols = TRUE) %>%
  step_time(trip_start, features = c("hour", "minute"), keep_original_cols = TRUE) %>%
  step_rm(trip_start_timestamp,
          trip_end_timestamp,
          taxi_id,
          contains("census"),
          contains("centroid"))

chicago_taxi <- prep(taxi_rec_base) |>
  bake(new_data = NULL) |>
  relocate(tip)

library(pins)
library(here)

board <- board_folder(here("pkgdown/assets/pins-board"), versioned = FALSE)
board |> pin_write(chicago_taxi, "chicago_taxi", type = "rds")
board |> write_board_manifest()
