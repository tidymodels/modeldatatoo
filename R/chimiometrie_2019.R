#' chimiometrie_2019 data set
#'
#' @description
#' A short description...
#'
#' @param ... Arguments passed to [pins::pin_read()].
#' @return tibble
#'
#' @details
#' Additional details...
#'
#' Please list what license this data is under...
#'
#' # tibble print
#'
#' ```{r}
#' data_chimiometrie_2019()
#' ```
#'
#' # glimpse()
#'
#' ```{r}
#' tibble::glimpse(data_chimiometrie_2019())
#' ```
#'
#' @source
#' Information about where the data comes from...
#'
#' @examples
#' \dontrun{
#' data_chimiometrie_2019()
#' }
#' @export
data_chimiometrie_2019 <- function(...) {
  pins::pin_read(modeldatatoo_board, "chimiometrie_2019", ...)
}
