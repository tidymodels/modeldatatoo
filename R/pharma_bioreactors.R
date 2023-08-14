#' Pharmaceutical manufacturing monitoring data set
#'
#' @description
#'
#' Samples were collected each day from all bioreactors and glucose was
#' measured using both spectroscopy and the traditional manner. The goal is to
#' create models on the data from the more numerous small-scale bioreactors
#' and then evaluate if these results can accurately predict what is happening
#' in the large-scale bioreactors (see details below).
#'
#' @param ... Arguments passed to [pins::pin_read()].
#' @return tibble
#'
#' @details
#'
#' ## Experimental Background
#'
#' Pharmaceutical companies use spectroscopy measurements to assess critical
#' process parameters during the manufacturing of a biological drug. Models
#' built on this process can be used with real-time data to recommend changes
#' that can increase product yield. In the example that follows, Raman
#' spectroscopy was used to generate the data. These data were generated from
#' real data, but have been distinctly modified to preserve confidentiality and
#' achieve illustration purposes.
#'
#' To manufacture the drug being used for this example, a specific type of
#' protein is required and that protein can be created by a particular type of
#' cell. A batch of cells are seeded into a _bioreactor_ which is a device that
#' is designed to help grow and maintain the cells. In production, a large
#' bioreactor would be about 2000 liters and is used to make large quantities
#' of proteins in about two weeks.
#'
#' Many factors can affect product yield. For example, because the cells are
#' living, working organisms, they need the right temperature and sufficient
#' food (glucose) to generate drug product. During the course of their work,
#' the cells also produce waste (ammonia). Too much of the waste product can
#' kill the cells and reduce the overall product yield. Typically key
#' attributes like glucose and ammonia are monitored daily to ensure that the
#' cells are in optimal production conditions. Samples are collected and
#' off-line measurements are made for these key attributes. If the measurements
#' indicate a potential problem, the manufacturing scientists overseeing the
#' process can tweak the contents of the bioreactor to optimize the conditions
#' for the cells.
#'
#' One issue is that conventional methods for measuring glucose and ammonia are
#' time consuming and the results may not come in time to address any issues.
#' Spectroscopy is a potentially faster method of obtaining these results
#' if an effective model can be used to take the results of the spectroscopy
#' assay to make predictions on the substances of interest (i.e., glucose and
#' ammonia).
#'
#' However, it is not feasible to do experiments using many large-scale
#' bioreactors. Two parallel experimental systems were used:
#'
#'  * 15 small-scale (5 liters) bioreactors were seeded with cells and were
#'   monitored daily for 14 days.
#' * Three large-scale bioreactors were also seeded with cells from the same
#'  batch and monitored daily for 14 days
#'
#'  ## Notes on Data
#'
#'  The intensity values have undergone signal processing up to smoothing. See
#'  the reference for more details.
#'
#'  ## License
#'
#' ```{r}
#' data_pharma_bioreactors()
#' ```
#'
#' # glimpse()
#'
#' ```{r}
#' tibble::glimpse(data_pharma_bioreactors())
#' ```
#'
#' @source
#' Kuhn, Max, and Kjell Johnson. _Feature engineering and selection: A practical
#' approach for predictive models_. Chapman and Hall/CRC, 2019.
#'
#' \url{https://bookdown.org/max/FES/illustrative-data-pharmaceutical-manufacturing-monitoring.html}
#'
#' @examples
#' \donttest{
#' data_pharma_bioreactors()
#' }
#' @export
data_pharma_bioreactors <- function(...) {
  pins::pin_read(modeldatatoo_board(), "pharma_bioreactors", ...)
}
