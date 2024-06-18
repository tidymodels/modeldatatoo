#' Cat Adoption
#'
#' @description
#' A subset of the cats at the animal shelter in Long Beach, California, USA.
#'
#' @param ... Arguments passed to [pins::pin_read()].
#' @return tibble
#'
#' @details
#'
#' A data frame with 2257 rows and 19 columns:
#' \describe{
#'   \item{time}{The time the cat spent at the shelter.}
#'   \item{event}{Did an event occur? The event is adoption or the cat being 
#' returned to the place they belong. The non-event is the cat being transferred
#' to another shelter or dying.}
#'   \item{sex}{The sex of the cat.}
#'   \item{neutered}{Whether the cat is neutered.}
#'   \item{intake_condition}{The intake condition of the cat.}
#'   \item{intake_type}{The type of intake.}
#'   \item{latitude}{Latitude of the intersection/cross street of intake or capture.}
#'   \item{longitude}{Longitude of the intersection/cross street of intake or capture.}
#'   \item{black}{Indicator for the color/pattern of the cat's fur.}
#'   \item{brown}{Indicator for the color/pattern of the cat's fur.}
#'   \item{brown_tabby}{Indicator for the color/pattern of the cat's fur.}
#'   \item{calico}{Indicator for the color/pattern of the cat's fur.}
#'   \item{cream}{Indicator for the color/pattern of the cat's fur.}
#'   \item{gray}{Indicator for the color/pattern of the cat's fur.}
#'   \item{gray_tabby}{Indicator for the color/pattern of the cat's fur.}
#'   \item{orange}{Indicator for the color/pattern of the cat's fur.}
#'   \item{orange_tabby}{Indicator for the color/pattern of the cat's fur.}
#'   \item{tan}{Indicator for the color/pattern of the cat's fur.}
#'   \item{tortie}{Indicator for the color/pattern of the cat's fur.}
#'   \item{white}{Indicator for the color/pattern of the cat's fur.}
#' }
#'
#' # tibble print
#'
#' ```{r}
#' data_cat_adoption()
#' ```
#'
#' # glimpse()
#'
#' ```{r}
#' tibble::glimpse(data_cat_adoption())
#' ```
#'
#' @source
#' 
#' <https://data.longbeach.gov/explore/dataset/animal-shelter-intakes-and-outcomes/information/>
#'
#' @examples
#' \donttest{
#' data_cat_adoption()
#' }
#' @export
data_cat_adoption <- function(...) {
  cat_adoption
  #pins::pin_read(modeldatatoo_board(), "cat_adoption", ...)
}

#' @rdname data_cat_adoption
"cat_adoption"