# check if invalid country returns error
library(testthat)
test_that('Correct eror is printed', {
  expect_error(CountryPopulation("InvalidCountry"))
  expect_error(CountryPopulation("lalala"))
})
