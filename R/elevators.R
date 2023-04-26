#' elevators data set
#'
#' @param ... Arguments passed to [pins::pin_read()].
#' @return tibble
#'
#' @details
#'
#' # tibble print
#'
#' ```{r}
#' data_elevators()
#' ```
#'
#' # glimpse()
#'
#' ```{r}
#' tibble::glimpse(data_elevators())
#' ```
#'
#' @examples
#' \dontrun{
#' data_elevators()
#' }
#' @export
data_elevators <- function(...) {
  pins::pin_read(modeldatatoo_board, "elevators", ...)
}
