# chartkick accepts list or json or matrix

# line chart
line_data <- jsonlite::fromJSON('{"2021-01-01": 11, "2021-01-02": 6}')
#line_df <- data.frame(date = c("2021-01-01", "2021-01-02"), value = c(11,6))
chartkick(data = line_data, type = "LineChart")


# pie chart

pie_data = jsonlite::fromJSON('[["Blueberry", 44], ["Strawberry", 23]]')

chartkick(data = pie_data, type = "PieChart", colors = list("purple", "red"))

# column chart

col_data = jsonlite::fromJSON('[["Sun", 32], ["Mon", 46], ["Tue", 28]]')

chartkick(data = col_data, type = "ColumnChart", colors = list("purple", "red", "green"))

# bar chart
bar_data <- jsonlite::fromJSON('[["Work", 32], ["Play", 1492]]')
chartkick(data = bar_data,type = "BarChart", colors = list("green","red"))

# area chart
area_data <- jsonlite::fromJSON('{"2021-01-01": 11, "2021-01-02": 6}')
chartkick(data = area_data,type = "AreaChart")

#scatter chart
scatter_data <- jsonlite::fromJSON('[[174.0, 80.0], [176.5, 82.3], [180.3, 73.6]]')
class(scatter_data) # "matrix" "array"

chartkick(data = scatter_data,type = "ScatterChart",colors = list("red"))

# geo chart
geo_data <- jsonlite::fromJSON('[["United States", 44], ["Germany", 23], ["Brazil", 22]]')

chartkick(data = geo_data,type = "GeoChart")

# Timeline - Google Charts
timeline_data <- jsonlite::fromJSON('[["Washington", "1789-04-29", "1797-03-03"], ["Adams", "1797-03-03", "1801-03-03"]]')
chartkick(data = timeline_data,type = "Timeline", colors = list("red", "green"))

# Multiple series
line_series_data = jsonlite::fromJSON(jsonNormalize::jsonNormalize('[
  {name: "Workout", data: {"2021-01-01": 3, "2021-01-02": 4}},
  {name: "Call parents", data: {"2021-01-01": 5, "2021-01-02": 3}}
]')) # did not work with chartkick

line_series_data <- jsonlite::toJSON(line_series_data)

chartkick(data = line_series_data,type = "LineChart", colors = list("green", "red"))


# Multiple series stacked and grouped - Chart.js or Highcharts

bar_st_data =  jsonlite::fromJSON(jsonNormalize::jsonNormalize('[
  {name: "Apple", data: {"Tuesday": 3, "Friday": 4}, stack: "fruit"},
  {name: "Pear", data: {"Tuesday": 1, "Friday": 8}, stack: "fruit"},
  {name: "Carrot", data: {"Tuesday": 3, "Friday": 4}, stack: "vegetable"},
  {name: "Beet", data: {"Tuesday": 1, "Friday": 8}, stack: "vegetable"}
]'))
class(bar_st_data) # [1] "data.frame" did not work with chartkick
bar_st_data <- jsonlite::toJSON(bar_st_data) # worked with chartkick
chartkick(data = bar_st_data,type = "BarChart", stacked = TRUE)



