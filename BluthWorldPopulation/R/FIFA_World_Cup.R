library(tidyverse)
library(rvest)

# Read in the data.  Do some cleaning/verification
url = 'https://en.wikipedia.org/wiki/FIFA_World_Cup'

page <- read_html(url)

World_Cup <- page %>%
  html_nodes('table') %>%
  .[[4]] %>%
  html_table(header=FALSE ) %>%
  slice(-1 * 1:2) %>%
  slice(-1 * 23:26) %>%
  select(X1, X2, X4, X5, X6) %>%
  rename(
    Year = X1,
    Hosts = X2,
    Totalattendance = X4,
    Matches = X5,
    Averageattendance = X6) %>%
  mutate(
    Totalattendance = str_remove_all(Totalattendance, ","),
    Averageattendance = str_remove_all(Averageattendance, ",")) %>%
  mutate(WorldCup = paste(Hosts, Year, sep="")) %>%
  mutate(WorldCup = str_replace_all(WorldCup, " ", "")) %>%
  select(-c(Year, Hosts))


# Save the data frame to the data/ directory as MaxTemp.rda
usethis::use_data(World_Cup, overwrite = TRUE)
