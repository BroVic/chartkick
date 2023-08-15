# Load the jsonlite package
library(jsonlite)

# line chart

linechart_df <- data.frame(dates = c("May 13, 2023", "May 14, 2023", "May 15, 2023",
                                     "May 16, 2023", "May 17, 2023", "May 18, 2023",
                                     "May 19, 2023", "May 20, 2023", "May 21, 2023",
                                     "May 22, 2023", "May 23, 2023", "May 24, 2023",
                                     "May 25, 2023", "May 26, 2023", "May 27, 2023",
                                     "May 28, 2023", "May 29, 2023", "May 30, 2023",
                                     "May 31, 2023"),
                           values = c(2, 5, 3, 8, 6, 6, 12, 5, 5, 3, 1, 6, 1, 3, 2, 3, 2, 8, 5))

# line_data <- jsonlite::fromJSON('{"2021-02-10":11,"2021-02-11":6,"2021-02-12":3,"2021-02-13":2,"2021-02-14":5,"2021-02-15":3,"2021-02-16":8,"2021-02-17":6,"2021-02-18":6,"2021-02-19":12,"2021-02-20":5,"2021-02-21":5,"2021-02-22":3,"2021-02-23":1,"2021-02-24":10,"2021-02-25":1,"2021-02-26":3,"2021-02-27":2,"2021-02-28":3,"2021-03-01":2,"2021-03-02":8}')

line_data <- jsonlite::fromJSON('{"10":11,"11":6,"12":3,"13":2,"14":5,"15":3,"16":8,"17":6,
                                "18":6,"19":12,"20":5,"21":5,"22":3,"23":1,"24":10,
                                "25":1,"26":3,"27":2,"28":3,"01":2,"02":8}')

# error - data must be a data.frame
# chartkick(data = line_data,
#           type = "LineChart",curve = TRUE,
#           colors = list("green"), label = "Value")

# chartkick(data = linechart_df,
#           type = "LineChart",curve = TRUE,
#           colors = list("green"), label = "Value")

chartkick(data = linechart_df, xcol = "dates",
          ycol = "values", curve = TRUE, type = "LineChart")

# pie chart ---------

pie_data = jsonlite::fromJSON('[["Blueberry", 44], ["Strawberry", 23]]')

pc_df <- as.data.frame(pie_data)

chartkick(data = pc_df, xcol = "V1", ycol = "V2",
          type = "PieChart", colors = list("red", "green"))

# column chart ----------------

col_data = jsonlite::fromJSON('[["Sun", 32], ["Mon", 46], ["Tue", 28]]')
cc_df <- as.data.frame(col_data)
chartkick(data = cc_df, xcol = "V1", ycol = "V2", type = "ColumnChart", colors = list("purple", "red", "green"))

# bar chart ---------------
bar_data <- jsonlite::fromJSON('[["Work", 352], ["Play", 1492]]')
bd_df <- as.data.frame(bar_data)
chartkick(data = bd_df, xcol = "V1", ycol = "V2",type = "BarChart", colors = list("green","red"))

# area chart -----------
area_data <- jsonlite::fromJSON('{"2021-01-01": 11, "2021-01-02": 6}')
ac_df <- data.frame(Date = names(area_data), Value = unlist(area_data))
ac_df <- tibble::remove_rownames(ac_df)

chartkick(data = ac_df, xcol = "Date", ycol = "Value",type = "AreaChart")

#scatter chart ------------------
scatter_data <- jsonlite::fromJSON('[[174.0, 80.0], [176.5, 82.3], [180.3, 73.6]]')
class(scatter_data) # "matrix" "array"

sc_df <- as.data.frame(scatter_data)

chartkick(data = sc_df, xcol = "V1", ycol = "V2", type = "ScatterChart",colors = list("red"))

# geo chart ----------------------
geo_data <- jsonlite::fromJSON('[["United States", 44], ["Germany", 23], ["Brazil", 22]]')
class(geo_data)

gc_df <- as.data.frame(geo_data)

chartkick(data = gc_df, type = "GeoChart")

# Timeline - Google Charts -----------------
timeline_data <- jsonlite::fromJSON('[["Washington", "1789-04-29", "1797-03-03"], ["Adams", "1797-03-03", "1801-03-03"]]')

class(timeline_data)

tl_df <- as.data.frame(timeline_data)

chartkick(data = tl_df, type = "Timeline", colors = list("red", "green"))






