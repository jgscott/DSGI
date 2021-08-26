
```{r}
nbc_pilotsurvey = read.csv('data/nbc_pilotsurvey.csv')[,c(1,2,4,10,18, 19)]
nbc_pilotsurvey %>%
  head(7) %>% knitr::kable() %>%
  kableExtra::kable_styling(full_width=FALSE)
```

```{r}
nbc_pilotsurvey %>%
  group_by(Show) %>%
  summarize_all(mean) %>%
  select(-Viewer) %>%
  arrange(desc(Q1_Excited)) %>%
  mutate_if(is.numeric, round, digits=2) %>%
  head(7) %>%
  knitr::kable() %>%
  kableExtra::kable_styling(full_width=FALSE)
```

```{r}
nbc_pilotsurvey %>%
  group_by(Viewer) %>%
  select(-Show) %>%
  summarize_all(mean) %>%
  arrange(desc(Q1_Excited)) %>%
  mutate_if(is.numeric, round, digits=2) %>%
  head(7) %>%
  knitr::kable() %>%
  kableExtra::kable_styling(full_width=FALSE)
```

```{r}
tvshows = read.csv('data/tvshows.csv')
head(tvshows) %>% knitr::kable() %>%
  kableExtra::kable_styling(full_width=FALSE)
```
