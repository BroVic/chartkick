library(palmerpenguins)


chartkick(data = palmerpenguins::penguins,xcol = "bill_length_mm", ycol = "bill_depth_mm",
          type = "ScatterChart",colors = list("blue"))



