#' Create a graph a countries population from 1990 to 2020
#'
#' @param countryInput A string of the country desired
#' @return a graph of the country's population from 1990 to 2020.
#'
#' @examples
#' CountryPopulation("Mexico")
#' CountryPopulation("Italy")
#' @export
CountryPopulation <- function(countryInput){
  library(tidyverse)

  if (!any(WorldPopulation$Country == countryInput)) {
    stop("Error: The country does not exist in the WorldPopulation data.")
  }

  WorldPopulation_long <- WorldPopulation %>%
    pivot_longer(cols = `1950`:`2020`, names_to = "Year", values_to = "Population") %>%
    filter(Country == countryInput)

  return(
    ggplot(WorldPopulation_long, aes(x = as.numeric(Year),
                                     y = as.numeric(Population), color = Country)) +
      geom_line() +
      labs(
        title = "Population Growth (1950-2020)",
        x = "Year",
        y = "Population",
        color = "Country") +
      theme_minimal()
  )
}
