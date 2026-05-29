data(mtcars)

# Histogram
hist(mtcars$mpg,
     main = "Histogram of MPG",
     xlab = "MPG")

# Boxplot
boxplot(mtcars$mpg,
        main = "Boxplot of MPG")

# Scatter Plot
plot(mtcars$wt,
     mtcars$mpg,
     main = "Weight vs MPG",
     xlab = "Weight",
     ylab = "MPG")

# Bar Plot
cylinders <- table(mtcars$cyl)

barplot(cylinders,
        main = "Cylinder Count")