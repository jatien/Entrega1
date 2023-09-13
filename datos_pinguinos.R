library("palmerpenguins")
library("tidyverse")

penguins %>% 
  count(sex)
penguins %>% 
  group_by(sex,species) %>% 
  summarize(across(where(is.numeric), mean, na.rm = TRUE))