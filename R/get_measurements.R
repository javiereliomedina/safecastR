#' Function for load measurements from Safecast API
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
#' data <- get_measurements(100, 52.520008, 13.404954)
#' data
#'
#' @export

get_measurements <- function(dist,
                             lat,
                             long,
                             ini_date = NULL,
                             end_date = NULL){

  # URLs
  res <- httr::GET("https://api.safecast.org/measurements.json",
                   query = list(distance = dist,
                                latitude = lat,
                                longitude = long,
                                captured_after=as.POSIXct(ini_date),
                                captured_before=as.POSIXct(end_date)
                   ))

  # Loop for getting all pages
  i <- 0
  pages <- list()
  repeat {
    mydata <- jsonlite::fromJSON(paste0(res$url, "&page=", i))
    message("Retrieving page ", i)
    pages[[i+1]] <- mydata
    i = i+1
    if (is.numeric(nrow(jsonlite::fromJSON(paste0(res$url, "&page=", i)))) == FALSE){
      break
    }
  }

  # Combine all into one
  data <- jsonlite::rbind_pages(pages)

  # Convert to sf object
  sf::st_as_sf(data, coords = c("longitude", "latitude"))

}

