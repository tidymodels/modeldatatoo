#' animals data set
#'
#' @param ... Arguments passed to [pins::pin_read()].
#' @return tibble
#'
#' @details
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
#' @examples
#' \dontrun{
#' data_animals()
#' }
#' @export
data_animals <- function(...) {
  pins::pin_read(modeldatatoo_board, "animals", ...)
}
