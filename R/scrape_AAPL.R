library(quantmod)
AAPL = getSymbols('AAPL', auto.assign = FALSE)
AAPL = adjustOHLC(AAPL)
aapl_returns = ClCl(AAPL) %>%
  na.omit() %>%
  as.data.frame() %>%
  transmute(return = ClCl.AAPL) %>%
  filter(return < 1)  # for some reason a stock split isn't caught and so I just filter it out

write.csv(aapl_returns, file='data/aapl_returns.csv', row.names=TRUE)
