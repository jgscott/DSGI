big_epa_cars <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-10-15/big_epa_cars.csv")


glimpse(big_epa_cars)

big_epa_cars %>%
  filter(grepl('Leaf', model)) %>%
  glimpse

epa_cars = big_epa_cars %>%
  mutate(Powertrain = replace_na(atvType, "Gasoline"),
         cityMPG = ifelse(city08U == 0, city08, city08U),
         highwayMPG = ifelse(highway08U == 0, highway08, highway08U)) %>%
  select(make, model, year, VClass, displ, cityMPG,  highwayMPG, co2TailpipeGpm, Powertrain) %>%
  filter(!grepl('Special Purpose', VClass)) %>%
  mutate(Category = case_when(
    grepl('Wagon', VClass) ~ "Wagon",
    grepl('Sport Utility Vehicle|Van|van', VClass) ~ "SUV/Van",
    grepl('Two Seater', VClass) ~ "TwoSeater",
    #grepl('van', tolower(VClass)) ~ "Van",
    grepl('Truck', VClass) ~ "Truck",
    grepl('subcompact|minicompact', tolower(VClass)) ~ "Small Car",
    grepl('Car', VClass) ~ "Car",
    TRUE ~ "Other"
  )) %>%
  mutate(Subcategory = VClass) %>%
  select(-VClass) %>%
  unique %>%
  arrange(desc(year), make, model)



epa_cars %>% group_by(year, Powertrain) %>% summarize(n()) %>% tail(20)

epa_cars %>% group_by(year, Category) %>% summarize(n()) %>% tail(20)



epa_cars %>% filter(year == 2020, Powertrain == "Gasoline") %>%
  arrange((cityMPG))


ggplot(filter(epa_cars, year==2020, Powertrain=='Gasoline')) + 
  geom_point(aes(x=displ, y=cityMPG), alpha=0.5) + 
  geom_smooth(aes(x=displ, y=cityMPG), method='lm') +
  facet_wrap(~Category)

ggplot(filter(epa_cars, Powertrain == "Gasoline")) + geom_boxplot(aes(x=factor(year), y=cityMPG))


write.csv(epa_cars, file='data/epa_cars.csv', row.names=FALSE)


ggplot(epa_cars_gas2020) +
  geom_histogram(aes(x=cityMPG)) +
  geom_vline(xintercept=quantile(epa_cars_gas2020$cityMPG, prob=c(0.25, 0.5, 0.75)), col='red', size=1) + 
  labs(title="EPA-rated City Gas Mileage: all 2020 gas-powered car models in U.S.",
       caption="n=736") + 
  geom_jitter(aes(x=cityMPG, y=-3), height=1.5, alpha=0.1)


ggplot(epa_cars_gas2020) +
  geom_histogram(aes(x=cityMPG)) +
  geom_vline(xintercept=mean(epa_cars_gas2020$cityMPG), col='blue', size=1) + 
  labs(title="EPA-rated City Gas Mileage: all 2020 gas-powered car models in U.S.",
       caption="n=736") + 
  geom_jitter(aes(x=cityMPG, y=-3), height=1.5, alpha=0.1)


ggplot(epa_cars_gas2020) +
  geom_histogram(aes(x=cityMPG)) +
  geom_vline(xintercept=quantile(epa_cars_gas2020$cityMPG, prob=c(0.05, 0.95)), col='red', size=1) + 
  labs(title="EPA-rated City Gas Mileage: all 2020 gas-powered car models in U.S.",
       caption="n=736") + 
  geom_jitter(aes(x=cityMPG, y=-3), height=1.5, alpha=0.1)
