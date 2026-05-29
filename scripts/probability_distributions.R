set.seed(123)

# Binomial Distribution
binomial_data <- rbinom(1000, 10, 0.5)

hist(binomial_data,
     main = "Binomial Distribution",
     xlab = "Values")

# Poisson Distribution
poisson_data <- rpois(1000, lambda = 5)

hist(poisson_data,
     main = "Poisson Distribution",
     xlab = "Values")

# Normal Distribution
normal_data <- rnorm(1000, mean = 50, sd = 10)

hist(normal_data,
     main = "Normal Distribution",
     xlab = "Values")