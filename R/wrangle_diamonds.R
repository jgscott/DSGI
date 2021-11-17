diamonds %>%
  filter(price >= 10000) %>%
  summarize(mu=median(carat))


diamonds %>%
  group_by(color) %>%
  summarize(med = median(carat)) %>%
  arrange(med)

diamonds %>%
  mutate(dpc = price/carat) %>%
  group_by(cut, color) %>%
  summarize(mu=median(dpc)) %>%
  arrange(desc(mu))
