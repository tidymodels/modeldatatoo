## code to prepare `cat_adoption` dataset goes here

library(tidyverse)
library(janitor)
library(recipes)
library(survival)

# data from
# https://data.longbeach.gov/explore/dataset/animal-shelter-intakes-and-outcomes/information/

harmonize_colors <- function(x) {
  x <- gsub("mut", "", x)

  x <- gsub("pt", "point", x)
  x <- gsub("(brn)|(br )", "brown ", x)
  x <- gsub("dil", "dilute", x)
  x <- gsub("org", "orange", x)
  x <- gsub("rd", "red", x)
  x <- gsub("slvr", "silver", x)
  x <- gsub("(crm )|(cr )", "cream ", x)
  x <- gsub("(slvr)|(sl)", "silver", x)
  x <- gsub("choc ", "chocolate ", x)
  x <- gsub("(lc )|(li )", "lilac ", x)
  x <- gsub("l-c", "lilac_cream", x, fixed = TRUE)
  x <- gsub("(bl )", "blue ", x)
  x <- gsub("^(y )", "yellow ", x)
  x <- gsub("(blk)|(bc)|(bk)", "black", x)

  # fur patterns
  x <- gsub("brind$", "brindle", x)
  x <- gsub("tab$", "tabby", x)

  # Things that are still unclear
  x <- gsub("b-c", "", x, fixed = TRUE) # "brown-cream"?"
  x <- gsub("s-t", "", x, fixed = TRUE)
  
  x <- trimws(x, which = "both")
  gsub("[[:space:]]+", "_", x)
}

raw <- read_csv("data-raw/animal-shelter-intakes-and-outcomes.csv") %>% 
  clean_names() %>% 
  filter(animal_type == "CAT" & 
          !is.na(outcome_type) &  
          intake_is_dead == "Alive on Intake" & 
          primary_color != "UNKNOWN" &
          secondary_color != "UNKNOWN") %>% 
  filter(
    !(outcome_type %in% c("DISPOSAL", "EUTHANASIA", "MISSING", "DUPLICATE")) 
  ) %>% 
  # There are multiple rows for some animals; take most recent
  arrange(animal_id, outcome_date) %>%
  slice_head(by = c(animal_id), n = 1)

event_list <- 
  c("adoption", "community cat", "foster", "foster to adopt", "homefirst", 
    "return to owner", "return to wild habitat", "shelter, neuter, return", 
    "trap, neuter, release")

other_list <- 
  c("died", "rescue", "return to rescue", "transfer", "transport")

cats <- raw %>% 
  mutate(
    across(where(is.character), tolower),
    time = as.numeric(difftime(outcome_date, intake_date, units = "days")),
    time = if_else(time < 0, NA_real_, time),
    time = if_else(time < 1, 1, time),
    event = if_else(outcome_type %in% event_list, 1, 0),
  ) %>% 
  filter(outcome_type %in% c(event_list, other_list) & time > 7) %>% 
  select(time, event, contains("color"), sex, intake_condition, intake_type, 
         jurisdiction, latitude, longitude, animal_id) %>% 
  mutate(
    # clean up color labels
    primary_color = harmonize_colors(primary_color),
    secondary_color = harmonize_colors(secondary_color),
    # underscores
    intake_condition = gsub("age/weight", "age_or_weight", intake_condition),
    intake_condition = gsub("[[:space:]]+", "_", intake_condition),
    intake_type = gsub("i/i", "i_i", intake_type, fixed = TRUE),
    intake_type = gsub("[[:punct:]]", "", intake_type),
    intake_type = gsub("[[:space:]]+", "_", intake_type),
    jurisdiction = gsub("[[:space:]]+", "_", jurisdiction)
  )

# Make indicators for color (which also contains pattern)
col_names <- function(var, lvl, ...) {
  lvl
}
cats_with_color_dummies <- cats %>% 
  recipe() %>% 
  step_dummy_multi_choice(ends_with("color"), threshold = 0.0, naming = col_names) %>% 
  step_other(intake_condition, intake_type, threshold = 0.02) %>%
  step_zv() %>% 
  prep() %>% 
  bake(new_data = NULL)

col_counts <- map_int(cats_with_color_dummies %>% select(-(1:9)), sum)
col_count_rm <- names(col_counts)[col_counts <= 20]  

cat_adoption <- 
  cats_with_color_dummies %>% 
  select(-all_of(col_count_rm)) %>% 
  mutate(event_time = Surv(time, event)) %>% 
  select(-time, -event, -animal_id, -jurisdiction) %>% 
  relocate(event_time)



# write to pin -----------------------------------------------------------

# temporary alternative
usethis::use_data(cat_adoption)

# library(pins)
# library(here)

# board <- board_folder(here("pkgdown/assets/pins-board"), versioned = FALSE)
# board |> pin_write(cat_adoption, "cat_adoption", type = "rds")
# board |> write_board_manifest()
