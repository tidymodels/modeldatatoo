#' Chimiometrie 2019 Data Set
#'
#' @description
#' Larsen and Clemmensen (2019) state: "This data set was published as the
#' challenge at the Chimiometrie 2019 conference held in Montpellier and is
#' available at the conference homepage. The data consist of 6915 training
#' spectra and 600 test spectra measured at 550 (unknown) wavelengths. The
#' target was the amount of soy oil (0-5.5%), ucerne (0-40%) and barley
#' (0-52%) in a mixture."
#'
#' The test set included a distribution shift due to the use of a different
#' instrument and this competition was designed to measure how models might be
#' made to be resistant to such a difference. However, since there are no
#' test set outcomes, we only include the training set here.
#'
#' There are 6,915 rows and 553 columns. The columns whose names start with
#' `wvlgth_` are the spectral values with the numbers in the column names
#' referring to the order (as opposed to the wavenumber). Fernández
#' Pierna (2020) suggest that the wavelengths range from 1300 2nm to 2398 2nm.
#'
#' The three outcome columns are `"soy_oil"`, `"lucerne"`, and `"barley"`.
#' @param ... Arguments passed to [pins::pin_read()].
#' @return A tibble.
#'
#' @details
#'
#' # glimpse()
#'
#' ```{r}
#' tibble::glimpse(data_chimiometrie_2019()[, 1:10])
#' ```
#'
#' ## License
#'
#' No license was given for the data.
#'
#' @source
#' \url{https://chemom2019.sciencesconf.org/resource/page/id/13.html}
#'
#' @references
#' J. Larsen and L. Clemmensen (2019) "Deep learning for Chemometric and
#' non-translational data," _arXiv.org_, \url{https://arxiv.org/abs/1910.00391}.
#'
#' J.A. Fernández Pierna, A. Laborde, L. Lakhal, M. Lesnoff, M. Martin, Y.
#' Roggo, and P. Dardenne (2020) "The applicability of vibrational spectroscopy
#' and multivariate analysis for the characterization of animal feed where the
#' reference values do not follow a normal distribution: A new chemometric
#' challenge posed at the 'Chimiométrie 2019' congress," _Chemometrics and
#' Intelligent Laboratory Systems_, vol 202, p. 104026.
#' \doi{10.1016/j.chemolab.2020.104026}
#'
#' @examples
#' \donttest{
#' data_chimiometrie_2019()
#' }
#' @export
data_chimiometrie_2019 <- function(...) {
  pins::pin_read(modeldatatoo_board, "chimiometrie_2019", ...)
}
