# load packages ----------------------------------------------------------------

library(tidyverse)

# make hex plot -------------------------------------------------------------

ggplot(diamonds, aes(carat, price)) +
  geom_hex(bins = 30)
  
