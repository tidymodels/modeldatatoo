#' Ames data set
#'
#' @description
#'
#' #' A data set from De Cock (2011) has 82 fields were recorded for 2,930
#' properties in Ames IA. This version is copies from the `AmesHousing` package
#' but does not include a few quality columns that appear to be outcomes
#' rather than predictors.
#'
#' See this links for the sources below for more information as well as
#' `?AmesHousing::make_ames`.
#'
#' @param ... Arguments passed to [pins::pin_read()].
#' @return tibble
#'
#' @details
#'
#' The full data dictionary can be found here
#' \url{https://jse.amstat.org/v19n3/decock/DataDocumentation.txt}.
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
#' @source
#'
#' De Cock, D. (2011). "Ames, Iowa: Alternative to the Boston Housing Data as an
#' End of Semester Regression Project," \emph{Journal of Statistics Education},
#' Volume 19, Number 3.
#'
#' \url{http://jse.amstat.org/v19n3/decock/DataDocumentation.txt}
#'
#' \url{http://jse.amstat.org/v19n3/decock.pdf}
#'
#' @examples
#' \donttest{
#' data_ames()
#' }
#' @export
data_ames <- function(...) {
  pins::pin_read(modeldatatoo_board, "ames", ...)
}
