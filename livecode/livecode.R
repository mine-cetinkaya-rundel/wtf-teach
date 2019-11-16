# load packages ----------------------------------------------------------------

library(reprex)

# reprex something -------------------------------------------------------------

library(tidyverse)

mtcars %>%
  group_by(cyl) %>%
  summarise(summary(mpg))