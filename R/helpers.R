.add_new_data <- function(name = NULL) {
  if (is.null(name)) {
    stop("Please supply file name to `name`.")
  }

  # R file
  file_r <- paste0("R/", name, ".R")

  if (file.exists(file_r)) {
    stop("`name` already used, please use another.")
  }

  file.create(file_r)

  lines_data_raw <- readLines("inst/template-r-file")
  lines_data_raw <- gsub("NAME_OF_DATA_SET", name, lines_data_raw)
  writeLines(lines_data_raw, file_r)
  if (rstudioapi::isAvailable() && rstudioapi::hasFun("navigateToFile")) {
    rstudioapi::navigateToFile(file_r)
  }
  else {
    utils::file.edit(file_r)
  }

  # data-raw file
  file_data_raw <- paste0("data-raw/", name, ".R")

  if (file.exists(file_data_raw)) {
    stop("`name` already used, please use another.")
  }

  file.create(file_data_raw)

  lines_data_raw <- readLines("inst/template-data-raw")
  lines_data_raw <- gsub("NAME_OF_DATA_SET", name, lines_data_raw)
  writeLines(lines_data_raw, file_data_raw)
  if (rstudioapi::isAvailable() && rstudioapi::hasFun("navigateToFile")) {
    rstudioapi::navigateToFile(file_data_raw)
  }
  else {
    utils::file.edit(file_data_raw)
  }
}
