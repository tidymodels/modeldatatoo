#' elevators data set
#'
#' @return tibble
#'
#' @details
#' ```{r echo=FALSE}
#' data_elevators <- function() {
#'   pins::pin_read(pins::board_folder("data-raw/"), "elevators")
#' }
#' ```
#'
#' The data set looks like:
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
data_elevators <- function() {
  pins::pin_read(modeldatatoo_board, "elevators")
}
