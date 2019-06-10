library(tidyverse)
library(ranger)

diamonds <- diamonds %>% 
  mutate(log_price = log(price),
         log_carat = log(carat))

fit <- ranger(log_price ~ log_carat, data = diamonds)
saveRDS(fit, file = "fit.rds")