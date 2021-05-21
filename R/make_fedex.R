
mu = 6.1
sigma = 5.6
sigma2 = sigma^2
b_gam = mu/sigma2
a_gam = mu*b_gam

x = rgamma(100000, shape=a_gam, rate = b_gam)

x = pmax(0.1, round(x, 2))

hist(x, 100)
mean(x)
sd(x)

D = data.frame(weight=x)

write.csv(D, file='data/fedex_sim.csv', row.names=FALSE)




grade_distribution = read.csv('data/grade_distribution.csv')
sample_n(grade_distribution, size = 45, weight = n, replace=TRUE) %>%
  select(GPA, letter_grade)
