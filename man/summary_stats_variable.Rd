% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarystats.R
\name{summary_stats_variable}
\alias{summary_stats_variable}
\title{Summary statistics of a numerical variable across the groups of a categorical variable}
\usage{
summary_stats_variable(data, cat_var, num_var, na_handling = TRUE)
}
\arguments{
\item{data}{A data frame containing the variables of interest.
It is named 'data' as it represents the data set that the function operates on.}

\item{cat_var}{A categorical variable within the data set.
It is called 'cat_var' to clearly indicate that this argument should represent a factor or categorical variable.}

\item{num_var}{A numeric variable within the data set.
It is named 'num_var' to indicate that this argument should represent a numeric variable.}

\item{na_handling}{Logical; can be either TRUE or FALSE.
If TRUE, NA values are removed from the calculations; if FALSE, NA values are included.
It is named 'na_handling' to clearly specify its role in handling missing values.}
}
\value{
A data frame with summary statistics (min, max, range, mean, median, standard deviation, count) for the numeric variable, grouped by the categorical variable.
}
\description{
This function calculates summary statistics (min, max, range, mean, meadian, standard deviation and count) of one numerical variable across the groups of one categorical variable from a data set.
}
\examples{
# Examples with the iris data set
summary_stats_variable(iris,Species,Sepal.Length, na_handling=TRUE)

}
