
<!-- README.md is generated from README.Rmd. Please edit that file -->

# summarystats

<!-- badges: start -->
<!-- badges: end -->

The goal of `summarystats` is to provide a simple and efficient way to
calculate summary statistics for a numerical variable grouped by a
categorical variable. This package is useful for data exploration and
quick analysis of summary metrics such as minimum, maximum, mean,
median, standard deviation, and count within each category.

## Installation

You can install the development version of `summarystats` from GitHub
with:

``` r
# Install summarystats package from GitHub
devtools::install_github("stat545ubc-2024/summarystats", ref="0.1.0")
```

## Example

This is a basic example that shows how to use the
`summary_stats_variable` function to calculate summary statistics for a
numerical variable grouped by a categorical variable:

``` r
library(summarystats)

# Calculate summary statistics for the variable 'Sepal.Length' grouped by 'Species' from the iris dataset
summary_stats_variable(iris,Species,Sepal.Length, na_handling=TRUE)
#> # A tibble: 3 × 8
#>   Species      min   max range  mean median    sd count
#>   <fct>      <dbl> <dbl> <dbl> <dbl>  <dbl> <dbl> <int>
#> 1 setosa       4.3   5.8   1.5  5.01    5   0.352    50
#> 2 versicolor   4.9   7     2.1  5.94    5.9 0.516    50
#> 3 virginica    4.9   7.9   3    6.59    6.5 0.636    50
```
