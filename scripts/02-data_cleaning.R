#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers
# Author: Jin Zhang
# Date: 19 September 2024
# Contact: kry.zhang@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  separate(col= time_period,
           into = c("year","month"),
           sep = "-") |>
  mutate(date = lubridate::ymd(paste(year,month,"01",sep="-"))
         )


cleaned_data |> 
  ggplot(aes(x=date, y= marriage_licenses))+
  geom_point()
  

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
