# chartkick
This is an implementation of the  [Chartkick.js](https://chartkick.com/) library in R using the [htmlwidgets](https://github.com/ramnathv/htmlwidgets) framework.


<h2 id="install">

Installation

</h2>


**To install the latest development version from GitHub:**

``` r
install.packages("remotes")
remotes::install_github("BWOlatunji/chartkick")
```

<h2 id="usage">

How to use

</h2>

Let try using the package to create a simple line chart with sample data frame as shown below

``` r
library(chartkick)

linechart_df <- data.frame(dates = c("May 13, 2023", "May 14, 2023", "May 15, 2023",
                                     "May 16, 2023", "May 17, 2023", "May 18, 2023",
                                     "May 19, 2023", "May 20, 2023", "May 21, 2023",
                                     "May 22, 2023", "May 23, 2023", "May 24, 2023",
                                     "May 25, 2023", "May 26, 2023", "May 27, 2023",
                                     "May 28, 2023", "May 29, 2023", "May 30, 2023",
                                     "May 31, 2023"),
                           values = c(2, 5, 3, 8, 6, 6, 12, 5, 5, 3, 1, 6, 1, 3, 2, 3, 2, 8, 5))


chartkick(data = linechart_df, x_axis = "dates",
          y_axis = "values", curve = TRUE, legend = FALSE, type = "LineChart")
```

## References:
- [Chart Examples](https://ankane.github.io/chartkick.js/examples/)
- [Installation and Data formats](https://github.com/ankane/chartkick.js#installation)
