data(mtcars)

# Linear Regression
model <- lm(mpg ~ wt,
            data = mtcars)

summary(model)

# Predictions
predicted_values <- predict(model)

head(predicted_values)

# Scatter Plot
plot(mtcars$wt,
     mtcars$mpg,
     main = "MPG vs Weight",
     xlab = "Weight",
     ylab = "MPG")

abline(model,
       lwd = 2)