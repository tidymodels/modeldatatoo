#' Chicago taxi data set
#'
#' @description
#'
#' A data set containing information on a subset of taxi trips in the city
#' of Chicago in 2022.
#'
#' @param ... Arguments passed to [pins::pin_read()].
#' @return tibble
#'
#' @details
#'
#' The source data are originally described on the linked City of Chicago
#' data portal. The data exported here are a pre-processed subset motivated by
#' the modeling problem of predicting whether a rider will tip or not.
#'
#' \describe{
#'   \item{tip}{Whether the rider left a tip. A factor with levels
#'     "yes" and "no".}
#'   \item{distance}{The trip distance, in odometer miles.}
#'   \item{company}{The taxi company, as a factor. Companies that occurred
#'     few times were binned as "other".}
#'   \item{local}{Whether the trip started in the same community
#'     area as it began. See the source data for community area values.}
#'   \item{dow}{The day of the week in which the trip began, as a
#'     factor.}
#'   \item{month}{The month in which the trip began, as a factor.}
#'   \item{hour}{The hour of the day in which the trip began, as a
#'     numeric.}
#' }
#'
#' Previous releases of this data (with `version = "20230630T214846Z-643d0"`)
#' included additional columns:
#'
#' \describe{
#'   \item{id}{A unique identifier for the trip, as a factor.}
#'   \item{duration}{The trip duration, in seconds.}
#'   \item{fare}{The cost of the trip fare, in USD}
#'   \item{tolls}{The cost of tolls for the trip, in USD.}
#'   \item{extras}{The cost of extra charges for the trip, in USD.}
#'   \item{total_cost}{The total cost of the trip, in USD. This is the
#'     sum of the previous three columns plus tip.}
#'   \item{payment_type}{Type of payment for the trip. A factor with levels
#'     "Credit Card", "Dispute", "Mobile", "No Charge", "Prcard", and "Unknown".}
#' }
#'
#' # tibble print
#'
#' ```{r}
#' data_taxi()
#' ```
#'
#' # glimpse()
#'
#' ```{r}
#' tibble::glimpse(data_taxi())
#' ```
#'
#' @source
#'
#' \url{https://data.cityofchicago.org/Transportation/Taxi-Trips/wrvz-psew}
#'
#' @examples
#' \donttest{
#' data_taxi()
#' }
#' @export
data_taxi <- function(...) {
  pins::pin_read(modeldatatoo_board(), "taxi", ...)
}
