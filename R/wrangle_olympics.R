olympics_top20 = read.csv('data/olympics_top20.csv')


vbheights = olympics_top20 %>%
  filter(sport == 'Volleyball') %>%
  group_by(sex, year) %>%
  summarize(mean_height = mean(height))


ggplot(vbheights) +
  geom_line(aes(x=year, y=mean_height, color=sex))

olympics_top20 %>%
  filter(sex == 'M', year==2012) %>%
  group_by(event) %>%
  summarize(median_weight = median(weight)) %>%
  arrange(desc(median_weight))


olympics_top20 %>%
  filter(sex == 'F') %>%
  group_by(event) %>%
  summarize(sd_height = sd(height)) %>%
  arrange(desc(sd_height))

olympics_top20 %>%
  filter(sex == 'F', sport == "Athletics") %>%
  summarize(q95 = quantile(height, 0.95))



swimming_age = olympics_top20 %>%
  filter(sport == 'Swimming') %>%
  group_by(sex, year) %>%
  summarize(mean_age = mean(age))


ggplot(swimming_age) +
  geom_line(aes(x=year, y=mean_age, color=sex))
