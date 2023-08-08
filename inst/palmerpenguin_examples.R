library(palmerpenguins)

# scatter chart
chartkick(data = penguins,xcol = "bill_length_mm", ycol = "bill_depth_mm",
          type = "ScatterChart",colors = list("blue"))

# Count penguins for each species
penguins_species_count <- penguins %>%
  count(species, .drop = FALSE)

# pie chart

chartkick(data = penguins_count, xcol = "species", ycol = "n",
          type = "PieChart", colors = list("red", "green", "blue"))

# column chart
chartkick(data = penguins_count, xcol = "species", ycol = "n",
          type = "ColumnChart", colors = list("red", "green", "blue"))

# bar chart
chartkick(data = penguins_count, xcol = "species", ycol = "n",
          type = "BarChart", colors = list("red", "green", "blue"))
