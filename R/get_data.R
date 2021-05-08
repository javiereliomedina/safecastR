#' Function for load data from Safecast API
#'
#' @param dist      Distance (m) for filtering measurements near a point
#' @param lat       Latitude of the point
#' @param long      Longitude of the point
#' @param ini_date  Filter measurements captured after this date
#' @param end_date  Filter measurements captured before this date
#'
#' @return A sf objects with Safecast data
#'
#' @examples
#' library(safecastR)
#' data <- get_measurements(100, 34.5, 135.5)
#'
#' data
#'
#' @export

get_measurements <- function(dist = 1000,
                             lat,
                             long,
                             ini_date = NULL,
                             end_date = NULL){
  res <- httr::GET("https://api.safecast.org/measurements.json",
                   query = list(distance = dist,
                                latitude = lat,
                                longitude = long,
                                captured_after=as.POSIXct(ini_date),
                                captured_before=as.POSIXct(end_date)
                   ))
  data <- jsonlite::fromJSON(rawToChar(res$content))
  sf::st_as_sf(data, coords = c("longitude", "latitude"), crs = 4326)
}
