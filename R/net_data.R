#' net_data data set
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
#' data_net_data()
#' ```
#'
#' # glimpse()
#'
#' ```{r}
#' tibble::glimpse(data_net_data())
#' ```
#'
#' @source
#' Information about where the data comes from...
#'
#' @examples
#' \dontrun{
#' data_net_data()
#' }
#' @export
data_net_data <- function(...) {
  pins::pin_read(modeldatatoo_board, "net_data", ...)
}
