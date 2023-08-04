#' Preprocess data frame
#'
#'
#' @param data A data frame
#' @param x column name containing values on the x-axis
#' @param y column name containing values on the y-axis
#'
#' @import assertthat jsonlite dplyr
#'
process_data <- function(data, x, y){
  if (!is.data.frame(data)) {
    stop("chartkick: 'data' must be a data.frame",
         call. = FALSE)
  }

  row.names(data) <- NULL

  df = data |>
    dplyr::select({{ x }}, {{ y }})
  # Remove the column names
  colnames(df) <- NULL

  # Convert the data frame to JSON
  json_data = jsonlite::toJSON(df)

  return(json_data)
}

