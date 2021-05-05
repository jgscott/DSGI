library(lubridate)
library(tidyverse)

load_ercot = read.csv('data/load_ercot.csv')
load_ercot$Time = ymd_hms(load_ercot$Time)
power_christmas_2015 = load_ercot %>%
  filter(month(Time) ==  12 & day(Time) == 25 & year(Time) <= 2012) %>%
  mutate(hour = hour(Time), date = date(Time)) %>%
  select(hour, date, ERCOT)

write.csv(power_christmas_2015, file='data/power_christmas.csv', row.names=FALSE, quote=TRUE)

ggplot(power_christmas_2015) +
  geom_line(aes(x = hour, y = ERCOT, color=factor(date)))

data(mpg)
car_class_summaries = mpg %>%
  group_by(class) %>%
  summarize(n = n(),
  average_cty = mean(cty),
            prop_4cyl = sum(cyl==4)/n())

write.csv(car_class_summaries, file='../data/car_class_summaries.csv', row.names=FALSE)

ggplot(car_classes) +
  geom_col(aes(x=class, y=average_cty))

ggplot(car_classes) +
  geom_col(aes(x=class, y=prop_4cyl))


ggplot(mpg) +
  geom_bar(aes(x=class))
