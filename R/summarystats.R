#' Summary statistics of a numerical variable across the groups of a categorical variable
#'
#' This function calculates summary statistics (min, max, range, mean, meadian, standard deviation and count) of one numerical variable across the groups of one categorical variable from a data set.
#'
#' @export
#'
#' @param data A data frame containing the variables of interest.
#' It is named 'data' as it represents the data set that the function operates on.
#' @param cat_var A categorical variable within the data set.
#' It is called 'cat_var' to clearly indicate that this argument should represent a factor or categorical variable.
#' @param num_var A numeric variable within the data set.
#' It is named 'num_var' to indicate that this argument should represent a numeric variable.
#' @param na_handling Logical; can be either TRUE or FALSE.
#' If TRUE, NA values are removed from the calculations; if FALSE, NA values are included.
#' It is named 'na_handling' to clearly specify its role in handling missing values.
#
#' @return A data frame with summary statistics (min, max, range, mean, median, standard deviation, count) for the numeric variable, grouped by the categorical variable.
#'
#'
#' @examples
#' # Examples with the iris data set
#' summary_stats_variable(iris,Species,Sepal.Length, na_handling=TRUE)
#'
#' @importFrom dplyr %>%
#'
summary_stats_variable <- function(data, cat_var, num_var, na_handling = TRUE) {
  # Check if cat_var is a factor. If not, stop the execution of the function and execute an error
  if (!is.factor(dplyr::pull(data, {{cat_var}}))) {
    stop('Error: The provided cat_var is not a categorical variable. Please provide a factor variable.')
  }

  # Check if num_var is numeric. If not, stop the execution of the function and execute an error
  if (!is.numeric(dplyr::pull(data, {{num_var}}))) {
    stop('Error: The provided num_var is not numeric. Please provide a numeric variable.')
  }

  # Calculate summary statistics for the numerical variable by groups of the categorical variable
  data %>%
    dplyr::group_by({{cat_var}}) %>%
    dplyr::summarise(
      min = min({{num_var}}, na.rm = na_handling),
      max = max({{num_var}}, na.rm = na_handling),
      range = max({{num_var}}, na.rm = na_handling) - min({{num_var}}, na.rm = na_handling),
      mean = mean({{num_var}}, na.rm = na_handling),
      median = stats::median({{num_var}}, na.rm = na_handling),
      sd = stats::sd({{num_var}}, na.rm = na_handling),
      count = dplyr::n()
    )
}

