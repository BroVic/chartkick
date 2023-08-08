#
# # Your JavaScript object
# js_object <- '{"2021-01-01": 11, "2021-01-02": 6}'
#
# # Parse the JSON object into an R list
# data_list <- jsonlite::fromJSON(js_object)
#
# data_frame <- data.frame(Date = names(data_list), Value = unlist(data_list))
# data_frame <- tibble::remove_rownames(data_frame)
#
# # Remove the column names
# colnames(data_frame) <- NULL
#
# # Convert the data frame to JSON
# json_data <- toJSON(data_frame)
#
# json_data
#
# chartkick(data = json_data,type = "LineChart")
