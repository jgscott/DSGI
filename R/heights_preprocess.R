library(tidyverse)
library(mosaic)

pearsonheights = read.csv('data/pearsonheights.csv')

heights = pearsonheights %>%
  scale(scale=FALSE) %>%
  as_tibble() %>%
  transmute(child = son,
            parent_mean = father)


head(heights)

ggplot(heights) + 
  geom_point(aes(x=parent_mean, y=child))

write.csv(heights, file='data/heights.csv', row.names=FALSE)



##########################
##########################
##########################
##########################

head(heights)

heights = heights %>%
  mutate(p_m = rank(SHGT)/nrow(heights),
         sex = ifelse(rbinom(nrow(heights), 1, p_m) == 1, "male", "female"))


ggplot(heights) + 
  geom_histogram(aes(x=SHGT, fill=sex))

cor(MHGT ~ FHGT, data=heights)

cor(MHGT ~ FHGT, data=heights)

heights = heights %>%
  group_by(sex) %>%
  mutate(child_resid = SHGT - mean(SHGT))

ggplot(heights) + 
  geom_histogram(aes(x=child_resid), breaks = seq(-8.5, 8.5, by=1))

heights = heights %>%
  mutate(mom_resid = MHGT - mean(MHGT),
         dad_resid = FHGT - mean(FHGT),
         mean_parent_resid = (mom_resid + dad_resid)/2)

ggplot(heights) + 
  geom_point(aes(x=mean_parent_resid, y=child_resid))

cor(child_resid ~ mom_resid, data=heights)
cor(child_resid ~ dad_resid, data=filter(heights, sex=='male'))

    