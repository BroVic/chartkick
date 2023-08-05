#' Draw Chartkick.js chart in R powered by htmlwidgets
#'
#' chartkick is an R package to draw charts based on Chartkick.js JavaScript Library
#'
#' @param data data.frame containing data series
#' @param xcol string representing the column name containing values on the x-axis
#' @param ycol string representing the column name containing values on the y-axis
#' @param type string representing the chart type name i.e. "LineChart"
#' @param width chart's width
#' @param height chart's height
#' @param elementId html element id
#' @param min minimum value on the y-axis
#' @param max maximum value on the y-axis
#' @param xmin minimum value on the y-axis
#' @param xmax maximum value on the y-axis
#' @param colors list of colors
#' @param stacked boolean value stacked columns or bars
#' @param discrete discrete axis
#' @param label for single series
#' @param xtitle x-axis title
#' @param ytitle y-axis title
#' @param curve straight lines between points instead of curve
#' @param points hide or show points
#' @param legend hide or show legend, (show by default) and legend position - bottom, top, left, right
#' @param donut display donut chart - true or false
#' @param suffix useful for percentages
#' @param prefix useful for currency - chartjs, highcharts
#' @param thousands set a thousands separator
#'
#' @import htmlwidgets assertthat
#'
#' @name chartkick
#'
#' @export
chartkick <- function(data, xcol = NULL, ycol = NULL,
                      type = "LineChart",min = 0,max = NULL,xmin = NULL,
                      xmax = NULL,colors = list(),stacked = FALSE,
                      discrete = FALSE,label = NULL,xtitle = NULL,
                      ytitle = NULL,curve = FALSE,points = TRUE,
                      legend = TRUE,donut = FALSE,prefix = NULL,
                      suffix = NULL,thousands = ",",width = NULL,
                      height = NULL,elementId = NULL) {

  assertthat::assert_that(type %in% c(
    "LineChart",
    "PieChart",
    "ColumnChart",
    "BarChart",
    "AreaChart",
    "ScatterChart",
    "GeoChart",
    "Timeline"
  ))

  options <- list(
    min = min,
    max = max,
    xmin = xmin,
    xmax = xmax,
    colors = colors,
    stacked = stacked,
    discrete = discrete,
    label = label,
    xtitle = xtitle,
    ytitle = ytitle,
    curve = curve,
    points = points,
    legend = legend,
    donut = donut,
    prefix = prefix,
    suffix = suffix,
    thousands = thousands
  )

  # process data
  json_data <- process_data(data = data, x = xcol, y = ycol)

  x = list(
    data = json_data,
    type = type,
    options = options
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'chartkick',
    x,
    width = width,
    height = height,
    package = 'chartkick',
    elementId = elementId,
    sizingPolicy = htmlwidgets::sizingPolicy(
      defaultWidth = "100%",
      # knitr.figure = FALSE,
      browser.fill = TRUE,
      padding = 0
    )
  )
}

#' Shiny bindings for chartkick
#'
#' Output and render functions for using chartkick within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a chartkick
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name chartkick-shiny
#'
#' @export
chartkickOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'chartkick', width, height, package = 'chartkick')
}

#' @rdname chartkick-shiny
#' @export
renderChartkick <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, chartkickOutput, env, quoted = TRUE)
}
