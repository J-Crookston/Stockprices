library(tidyverse)
library(quantmod)
library(lubridate)

stock_df   <- readxl::read_excel("prices.xlsx", sheet="Price")

stock_df   <- stock_df %>% 
  mutate(Last=(quantmod::getQuote(Stock)[[2]])) %>% 
  mutate(Date=quantmod::getQuote(Stock)[[1]])

new <- quantmod::getQuote(stock_df$Stock) %>% 
  rownames_to_column("Stock")

write_csv(new, "output.csv")

cat("Script finished\n")

