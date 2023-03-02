#' Ames data set
#'
#' @return tibble
#'
#' @details
#'
#' # tibble print
#'
#' ```{r}
#' data_ames()
#' ```
#'
#' # glimpse()
#'
#' ```{r}
#' tibble::glimpse(data_ames())
#' ```
#'
#' @examples
#' \dontrun{
#' data_ames()
#' }
#' @export
data_ames <- function() {
  pins::pin_read(modeldatatoo_board, "ames")
}
