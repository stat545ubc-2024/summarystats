# Test 1: Variables with no NAs
test_that("summary_stats_variable works with vectors without NAs", {
  result <- summary_stats_variable(iris, Species, Sepal.Length, na_handling = TRUE)

  # Expect that the result is a data frame
  expect_s3_class(result, "data.frame")

  # Expect the number of rows to be equal to the number of unique categories in species
  expect_equal(nrow(result), length(unique(iris$Species)))

  # Expect that the columns contain the expected summary statistics
  expect_true(all(c("min", "max", "range", "mean", "median", "sd", "count") %in% colnames(result)))
})

# Test 2: Numeric variable with NAs
test_that("summary_stats_variable handles NAs correctly", {
  # Introduce some NAs into the numerical variable
  iris_na <- iris
  iris_na$Sepal.Length[1:5] <- NA

  result <- summary_stats_variable(iris_na, Species, Sepal.Length, na_handling = TRUE)

  # Expect that the result is still a data frame
  expect_s3_class(result, "data.frame")

  # Expect that the number of rows is equal to the number of unique categories in species
  expect_equal(nrow(result), length(unique(iris$Species)))

  # Ensure that no errors occur and the result is valid
  expect_true(all(!is.na(result$mean)))
})

# Test 3: Categorical variable with NAs
test_that("summary_stats_variable handles NAs in cat_var correctly", {
  # Introduce some NAs into the categorical variable
  iris_na <- iris
  iris_na$Species[1:5] <- NA

  result <- summary_stats_variable(iris_na, Species, Sepal.Length, na_handling = TRUE)

  # Expect that the result is still a data frame
  expect_s3_class(result, "data.frame")

  # Expect that the number of rows is equal to the number of unique categories in species + 1 for NA
  expect_equal(nrow(result), length(unique(iris$Species)) + 1)

  # Check if there is a row where 'Species' is NA
  expect_true(any(is.na(result$Species)))

  # Ensure that the mean is calculated correctly for non-NA rows
  non_na_means <- result$mean[!is.na(result$Species)]
  expect_true(all(!is.na(non_na_means)))
})

# Test 4: Attempt to use a numeric variable for 'cat_var'
test_that("summary_stats_variable throws error when numeric is used for cat_var", {
  expect_error(
    summary_stats_variable(iris, Sepal.Width, Sepal.Length, na_handling = TRUE),
    "Error: The provided cat_var is not a categorical variable"
  )
})

# Test 5: Attempt to use a categorical variable for 'num_var'
test_that("summary_stats_variable throws error when categorical is used for num_var", {
  expect_error(
    summary_stats_variable(iris, Species, Species, na_handling = TRUE),
    "Error: The provided num_var is not numeric"
  )
})
