#' Preprocess data frame
#'
#'
#' @param data A data frame
#' @param x string value of column name containing values on the x-axis
#' @param y string value of column name containing values on the y-axis
#' @param group string value of column name for grouping
#'
#' @import assertthat jsonlite dplyr
#'
process_data <- function(data = NULL,x = NULL, y = NULL, group = NULL){

  if (!is.data.frame(data)) {
    stop("chartkick: 'data' must be a data.frame",
         call. = FALSE)
  }

  # convert missing data to empty data frame
  if (missing(data)) {
    data <- data.frame()
  }

  if(!is.null(data) & is.null(x) & is.null(y) & is.null(group)){

    colnames(data) <- NULL

  } else if (!is.null(x) & !is.null(y) & is.null(group)) {

    # select ONLY x and y columns
    data <- data |> dplyr::select(x,y)
    #data[, c(x,y)]
    # Remove the column names
    colnames(data) <- NULL

  } else if (!is.null(group)) {

    # if group is defined, then x and y must be specified
    stopifnot(!is.null(x) & !is.null(y))

    # select ONLY x,y,group columns
    data <- data |> dplyr::select(x, y, group)
    #data[, c(x, y, group)]

    groups <- as.character(unique(data[[group]]))

    data_values <- data |>
      tidyr::pivot_wider(names_from = x, values_from = y) |>
      tidyr::nest(data = as.character(unique(data[[x]])))

    data <- tibble::tibble(name = groups, data = data_values)

  } else {

    stop('Please provide your "x", "y" and "group" combination')

  }

  # Convert the data frame to JSON
  json_data = jsonlite::toJSON(data, dataframe = 'rows')

  return(json_data)
}


#' @importFrom magrittr %>%
#' @export
magrittr::`%>%`


