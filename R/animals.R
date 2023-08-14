#' animals data set
#'
#' @description
#'
#' Data set with characteristics of many animals, including the field `text`
#' which is a long-form description of the animal.
#'
#' @param ... Arguments passed to [pins::pin_read()].
#' @return tibble
#'
#' @details
#'
#' This data set contains quite a bit of missing data and malformed fields.
#'
#' # tibble print
#'
#' ```{r}
#' data_animals()
#' ```
#'
#' # glimpse()
#'
#' ```{r}
#' tibble::glimpse(data_animals())
#' ```
#'
#' @source
#'
#' \url{https://github.com/emilhvitfeldt/animals}
#'
#' @examples
#' \donttest{
#' data_animals()
#' }
#' @export
data_animals <- function(...) {
  pins::pin_read(modeldatatoo_board(), "animals", ...)
}
