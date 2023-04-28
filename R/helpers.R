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

  lines <- readLines(template)
  lines <- gsub("NAME_OF_DATA_SET", name, lines)
  file.create(file)
  writeLines(lines, file)
  if (rstudioapi::isAvailable() && rstudioapi::hasFun("navigateToFile")) {
    rstudioapi::navigateToFile(file)
  }
  else {
    utils::file.edit(file)
  }
}

.add_new_data_collection <- function(name = NULL, data_sets = NULL) {
  if (is.null(name)) {
    stop("Please supply file name to `name`.")
  }

  if (is.null(data_sets)) {
    stop("Please supply all object names name to `data_sets`.")
  }

  # R file
  file_r <- paste0("R/", name, ".R")

  if (file.exists(file_r)) {
    stop("`name` already used, please use another.")
  }

  lines <- readLines("inst/template-r-file-collection")
  lines <- gsub("NAME_OF_DATA_SET", name, lines)
  lines <- gsub("OTHER_ALIASES", paste(data_sets, collapse = " "), lines)

  TIBBLE_PRINTS_index <- which(lines == "TIBBLE_PRINTS")

  TIBBLE_PRINTS_insert <- c(
    paste0("#' attach_", name ,"()"),
    "#'",
    paste0("#' ", data_sets)
  )

  lines <- c(
    lines[seq(1, TIBBLE_PRINTS_index - 1)],
    TIBBLE_PRINTS_insert,
    lines[seq(TIBBLE_PRINTS_index + 1, length(lines))]
  )

  GLIMPSE_PRINTS_index <- which(lines == "GLIMPSE_PRINTS")

  GLIMPSE_PRINTS_insert <- c(
    paste0("#' tibble::glimpse(", data_sets, ")")
  )

  lines <- c(
    lines[seq(1, GLIMPSE_PRINTS_index - 1)],
    GLIMPSE_PRINTS_insert,
    lines[seq(GLIMPSE_PRINTS_index + 1, length(lines))]
  )

  file.create(file_r)
  writeLines(lines, file_r)
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

  lines <- readLines("inst/template-data-raw-collection")
  lines <- gsub("NAME_OF_DATA_SET", name, lines)

  LIST_PRINTS_index <- which(lines == "LIST_PRINTS")

  LIST_PRINTS_insert <- c(
    paste0(
      "  ", data_sets, " = ...", rep(c(",", ""), c(length(data_sets) - 1, 1))
    )
  )

  lines <- c(
    lines[seq(1, LIST_PRINTS_index - 1)],
    LIST_PRINTS_insert,
    lines[seq(LIST_PRINTS_index + 1, length(lines))]
  )

  file.create(file_data_raw)
  writeLines(lines, file_data_raw)
  if (rstudioapi::isAvailable() && rstudioapi::hasFun("navigateToFile")) {
    rstudioapi::navigateToFile(file_data_raw)
  }
  else {
    utils::file.edit(file)
  }

  setup_file(file_data_raw, name, "inst/template-data-raw-collection")

  return(invisible())
}
