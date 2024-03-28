#' NYC Building Complaints
#'
#' A subset of the complaints received by the Department of Buildings (DOB) in New York City, USA.
#'
#' @format ## `building_complaints`
#' A data frame with 4,234 rows and 11 columns:
#' \describe{
#'   \item{days_to_disposition}{Days to disposition of the complaint}
#'   \item{status}{Status of the complaint}
#'   \item{year_entered}{Year the complaint was entered}
#'   \item{latitude, longitude}{Geographic coordinates}
#'   \item{borough}{Borough}
#'   \item{special_district}{Special district}
#'   \item{unit}{Unit dispositioning the complaint}
#'   \item{community_board}{Community board. 3-digit identifier: Borough code = first position, last 2 = community board}
#'   \item{complaint_category}{Complaint category}
#'   \item{complaint_priority}{Complaint priority}
#' }
#' @source <https://data.cityofnewyork.us/Housing-Development/DOB-Complaints-Received/eabe-havv/about_data>
"building_complaints"
