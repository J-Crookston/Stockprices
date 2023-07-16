library(tidyverse)
library(quantmod)
library(lubridate)

stock_df   <- readxl::read_excel("C:\\Users\\cfr45\\OneDrive\\Documents\\10-Programming\\01-R\\StockPrices\\stocknames.xlsx", sheet="Price")

stock_df   <- stock_df %>% 
  mutate(Last=(quantmod::getQuote(Stock)[[2]])) %>% 
  mutate(Date=as.Date(quantmod::getQuote(Stock)[[1]], "%Y-%m-%d"))

new <- quantmod::getQuote(stock_df$Stock) %>% 
  rownames_to_column("Stock")

write_csv(new, "C:\\Users\\cfr45\\OneDrive\\Documents\\10-Programming\\01-R\\StockPrices\\output.csv")

cat("Script finished\n");

