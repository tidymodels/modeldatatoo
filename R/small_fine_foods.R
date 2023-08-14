#' small_fine_foods data sets
#'
#' @description
#' Training and testing data set of fine food reviews.
#'
#' @param envir Environment to load data sets into. Defaults to
#'   `parent.frame()`.
#' @param quiet Logical, should function announce what data sets are loaded.
#' @param ... Arguments passed to [pins::pin_read()].
#' @return tibble
#'
#' @details
#'
#' These data are from Amazon, who describe it as "This dataset consists of
#'  reviews of fine foods from amazon. The data span a period of more than 10
#'  years, including all ~500,000 reviews up to October 2012. Reviews include
#'  product and user information, ratings, and a plaintext review."
#'
#' A subset of the data are contained here and are split into a training and
#'  test set. The training set sampled 10 products and retained all of their
#'  individual reviews. Since the reviews within these products are correlated,
#'  we recommend resampling the data using a leave-one-product-out approach. The
#'  test set sampled 500 products that were not included in the training set
#'  and selected a single review at random for each.
#'
#' There is a column for the product, a column for the text of the review, and
#'  a factor column for a class variable. The outcome is whether the reviewer
#'  gave the product a 5-star rating or not.
#'
#' # tibble print
#'
#' ```{r}
#' attach_small_fine_foods()
#'
#' training_data
#' testing_data
#' ```
#'
#' # glimpse()
#'
#' ```{r}
#' tibble::glimpse(training_data)
#' tibble::glimpse(testing_data)
#' ```
#'
#' @name small_fine_foods
#' @aliases small_fine_foods training_data testing_data
#'
#' @source
#'
#' \url{https://snap.stanford.edu/data/web-FineFoods.html}
#'
#' @examples
#' \donttest{
#' attach_small_fine_foods()
#' }
#' @export
attach_small_fine_foods <- function(envir = parent.frame(),
                                    quiet = FALSE,
                                    ...) {
  data <- pins::pin_read(modeldatatoo_board(), "small_fine_foods", ...)

  data_names <- names(data)

  for (name in data_names) {
    envir[[name]] <- data[[name]]
  }

  if (!quiet) {
    cat(
      "The following data sets have been loaded:",
      paste(paste0("`", data_names, "`"), collapse = ", "),
      "Silence this message by setting `quiet = TRUE`.",
      sep = "\n"
    )
  }

  return(invisible())
}
