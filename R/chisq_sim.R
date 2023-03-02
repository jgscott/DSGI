library(tidyverse)
library(mosaic)


travis

N = 10*12

pop_prop = c(0.074, 0.089, 0.336, 0.489, 0.012)
counts_expected = pop_prop * N
counts_observed = c(9, 4, 31, 74, 2)

# z-score for each observed count
z_obs = (counts_observed - counts_expected)/sqrt(counts_expected)
sum(z_obs^2)


# simulate some counts
counts_sim = rmultinom(n=1, size=N, prob=pop_prop)
z_sim = (counts_sim - counts_expected)/sqrt(counts_expected)
z_sim

sum(z_sim^2)

sum((sim_counts - expected_counts)^2 / expected_counts)

travis = tibble(
  group = c("Asian", "Black", "Hispanic", "White", "Everyone else"),
  pop_prop,
  counts_expected,
  counts_observed,
  difference = observed_counts - expected_counts,
  z = difference/sqrt(counts_expected)
)



# Let's take a random sample from the population to form 50 juries (50*12=480)
sim_counts = slice_sample(travis, n = 120, weight_by = pop_prop, replace=TRUE) %>%
  group_by(group, .drop=FALSE) %>%
  summarize(sim_count = n())
sim_counts

sim_counts %>%
  mutate(z = n - expected_counts)




p_hat = {observed_counts/N} %>%
  round(3)
p_hat
p_true


sim = do(10000)*{

  # sample the population to form our 50 juries
  # this is simulating under the "null model", i.e.
  # that juries are random samples from the county
  jury_sim = sample_n(travis, size = 480, weight = pop_prop, replace=TRUE) %>%
    count(group, .drop=FALSE)

  # compate chi-squared

  z2 = (jury_sim$n - expected_counts)^2/expected_counts
  sum(z2)
}

ggplot(sim) +
  geom_histogram(aes(x=result))

