library(tidyverse)
library(readxl)

# Read in the data.  Do some cleaning/verification
WorldPopulation <- read_excel('data-raw/World_Population.xlsx',
                              sheet = 'ESTIMATES', range="A17:BZ306") %>%
  filter(Type == "Country/Area") %>%
  mutate(Country = `Region, subregion, country or area *`) %>%
  select(Country, `1950`:`2020`)

# Save the data frame to the data/ directory as MaxTemp.rda
usethis::use_data(WorldPopulation, overwrite = TRUE)
