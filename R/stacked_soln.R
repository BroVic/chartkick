#
# # continue tomorrow
# # Multiple series -------------
# # line_series_data = jsonlite::fromJSON(jsonNormalize::jsonNormalize('[
# #   {name: "Workout", data: {"2021-01-01": 3, "2021-01-02": 4}},
# #   {name: "Call parents", data: {"2021-01-01": 5, "2021-01-02": 3}}
# # ]')) # did not work with chartkick
# #
# # class(line_series_data)
#
# # Not working properly - pending
# line_series_data <- jsonlite::toJSON(line_series_data)
#
# line_series_data <- data.frame(tasks = c("Workout","Call parents",
#                                          "Workout", "Call parents"),
#                                dates = c("2021-01-01","2021-01-01",
#                                          "2021-01-02","2021-01-02"),
#                                values = c(3, 5, 4, 3))
#
# chartkick(data = line_series_data, xcol = "dates",
#           ycol = "values", type = "LineChart",
#           colors = list("green", "red"))
#
#
# # Multiple series stacked and grouped - Chart.js or Highcharts
#
# bar_st_data =  jsonlite::fromJSON(jsonNormalize::jsonNormalize('[
#   {name: "Apple", data: {"Tuesday": 3, "Friday": 4}, stack: "fruit"},
#   {name: "Pear", data: {"Tuesday": 1, "Friday": 8}, stack: "fruit"},
#   {name: "Carrot", data: {"Tuesday": 3, "Friday": 4}, stack: "vegetable"},
#   {name: "Beet", data: {"Tuesday": 1, "Friday": 8}, stack: "vegetable"}
# ]'))
#
# jsonlite::toJSON(bar_st_data)
#
#
# chartkick(data = x, type = "BarChart", stacked = TRUE)
#
# # get class of each column in a data frame
# output <- map(bar_st_data, class)
#
# unnested_tbl <- bar_st_data |>
#   unnest(data) |>
#   pivot_longer(!c(name, stack),
#                names_to = "day",
#                values_to = "value")
#
# # expected tbl
# nested_tbl <- unnested_tbl |>
#   pivot_wider(names_from = day, values_from = value) |>
#   nest(data = c(Tuesday, Friday))
#
#
#
#
#
#
# class(bar_st_data) # [1] "data.frame" did not work with chartkick
# bar_st_data <- jsonlite::toJSON(bar_st_data, pretty = TRUE, auto_unbox = TRUE) # worked with chartkick
#
# bar_df <- data.frame(bar_st_data)
#
# chartkick(data = bar_st_data, xcol = "count", ycol = "days",type = "BarChart", stacked = TRUE)
#
#
# bar_st_df <- data.frame(
#   items    = c("Apple","Pear","Carrot","Beet",
#                "Apple","Pear","Carrot","Beet"),
#   days     = c("Tuesday","Tuesday","Tuesday","Tuesday",
#                "Friday","Friday","Friday","Friday"),
#   count   = c(3, 1, 3, 1, 4, 8, 4, 8),
#   category = c("fruit", "fruit", "vegetable", "vegetable",
#                "fruit", "fruit", "vegetable", "vegetable")
# )
#
# chartkick(data = bar_st_df, xcol = "count", ycol = "days", type = "BarChart",
#           stacked = TRUE)
