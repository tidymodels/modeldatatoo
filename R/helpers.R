.add_new_data <- function(name = NULL) {
  if (is.null(name)) {
    stop("Please supply file name to `name`.")
  }

  # R file
  file_r <- paste0("R/", name, ".R")
  setup_file(file_r, name, "inst/template-r-file")

  # data-raw file
  file_data_raw <- paste0("data-raw/", name, ".R")
  setup_file(file_data_raw, name, "inst/template-data-raw")

  return(invisible())
}

setup_file <- function(file, name, template) {
  if (file.exists(file)) {
    stop("`name` already used, please use another.")
  }

  file.create(file)

  lines_data_raw <- readLines(template)
  lines_data_raw <- gsub("NAME_OF_DATA_SET", name, lines_data_raw)
  writeLines(lines_data_raw, file)
  if (rstudioapi::isAvailable() && rstudioapi::hasFun("navigateToFile")) {
    rstudioapi::navigateToFile(file)
  }
  else {
    utils::file.edit(file)
  }
}
