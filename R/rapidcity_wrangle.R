
```{r}
rapidcity %>%
  sample_n(10) %>%
  arrange(Year, Month) %>%
  knitr::kable()
```

```{r}
rapidcity %>%
  filter(Year==2007, Month==1) %>%
  head(10) %>%
  knitr::kable()
```

```{r}
rapidcity %>%
  filter(Year==2007, Month==1) %>%
  summarize(mean(Temp), min(Temp), max(Temp))
```


```{r}
rapidcity %>%
  group_by(Year, Month) %>%
  summarize(mean_Temp = mean(Temp), min_Temp = min(Temp), max_Temp = max(Temp)) %>%
  round(1) %>%
  #arrange(mean_Temp) %>%
  knitr::kable()
```
