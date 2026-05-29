data(iris)

# T-Test
t_result <- t.test(iris$Sepal.Length,
                   mu = 5.5)

print(t_result)

# Chi-Square Test
observed <- c(50, 30, 20)

chi_result <- chisq.test(observed)

print(chi_result)

# ANOVA
anova_model <- aov(Sepal.Length ~ Species,
                   data = iris)

summary(anova_model)