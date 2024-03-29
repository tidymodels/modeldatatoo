## code to prepare `building_complaints` dataset goes here

library(tidyverse)
library(janitor)
library(tabulizer)

# main data source:
# https://data.cityofnewyork.us/Housing-Development/DOB-Complaints-Received/eabe-havv/about_data

# complaint codes ---------------------------------------------------------

complaint_category <- 
  extract_tables("data-raw/DOBComplaints_complaint_category_list.pdf") %>% 
  map(function(tab) {
    colnames(tab) <- c("code", "complaint_description", "complaint_priority")
    tab[-1,] %>% 
      as_tibble()
  }) %>% 
  list_rbind()

manual_fix <- tibble(
  code = "23",
  complaint_description = "Sidewalk Shed/Supported Scaffold/Inadequate/Defective/None/No Permit/No Cert",
  complaint_priority = "B"
)

complaint_category <- complaint_category %>% 
  filter(!(code %in% c("", "23"))) %>%
  bind_rows(manual_fix)


# geocode -----------------------------------------------------------------

# Max geocoded these, it took ages
load("data-raw/DOB_complaints_geocoded.RData")

# -------------------------------------------------------------------------

complaints_raw <- read_csv("data-raw/DOB_Complaints_Received_2023_2024.csv") %>% 
  clean_names()

complaints_feat <- complaints_raw %>% 
  left_join(complaint_category, by = c("complaint_category" = "code")) %>% 
  mutate(
    date_entered = mdy(date_entered),
    date_disposition = mdy(disposition_date),
    days_to_disposition = difftime(pmin(date_disposition, dob_run_date), 
                                   date_entered, 
                                   units = "days") %>% as.numeric(),
    year_entered = year(date_entered), 
    borough = str_sub(complaint_number, 1, 1),
    borough = case_when(
      borough == "1" ~ "Manhattan",
      borough == "2" ~ "Bronx",
      borough == "3" ~ "Brooklyn",
      borough == "4" ~ "Queens",
      borough == "5" ~ "Staten Island"
    ),
    special_district = if_else(is.na(special_district), "None", special_district)
  )

building_complaints <- complaints_geocoded %>%
  filter(!is.na(longitude), !is.na(latitude)) %>%
  left_join(complaints_feat, by = "complaint_number") %>%
  filter(!is.na(status)) %>% 
  filter(days_to_disposition > 0) %>% 
  select(
    days_to_disposition, status, year_entered,
    latitude, longitude, borough, special_district,
    unit, community_board, complaint_category, complaint_priority
  ) %>% 
  mutate(
    year_entered = factor(year_entered),
    borough = factor(borough),
    special_district = fct_relevel(special_district, "None"),
    unit = factor(unit),
    community_board = factor(community_board),
    complaint_category = factor(complaint_category),
    complaint_priority = factor(complaint_priority, levels = LETTERS[1:4])
  )

building_complaints <- building_complaints %>% 
  mutate(odd_location = if_else(borough == "Brooklyn" & latitude > 41, TRUE, FALSE)) %>% 
  filter(!odd_location) %>% 
  select(-odd_location)

library(janitor)
building_complaints <- clean_names(building_complaints)

library(pins)
library(here)

board <- board_folder(here("pkgdown/assets/pins-board"), versioned = FALSE)
board |> pin_write(building_complaints, "building_complaints", type = "rds")
board |> write_board_manifest()
