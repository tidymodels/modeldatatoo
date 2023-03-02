#' Ames data set
#'
#' @return tibble
#'
#' @details
#' ```{r echo=FALSE}
#' data_ames <- function() {
#'   pins::pin_read(pins::board_folder("data-raw/"), "ames")
#' }
#' ```
#'
#' The data set looks like:
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
