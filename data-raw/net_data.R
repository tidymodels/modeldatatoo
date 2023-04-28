## code to prepare `net_data` dataset goes here

# pak::pak("r-causal/causalworkshop")

net_data <- causalworkshop::net_data
net_data$net = ifelse(net_data$net, "Yes", "No")

library(janitor)
net_data <- clean_names(net_data)

library(pins)
library(here)

board <- board_folder(here("pkgdown/assets/pins-board"), versioned = FALSE)
board |> pin_write(net_data, "net_data", type = "rds")
board |> write_board_manifest()
