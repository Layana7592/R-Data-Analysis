data(mtcars)

# Pearson Correlation
pearson_corr <- cor(mtcars$mpg,
                    mtcars$wt,
                    method = "pearson")

cat("Pearson Correlation:", pearson_corr, "\n")

# Spearman Correlation
spearman_corr <- cor(mtcars$mpg,
                     mtcars$wt,
                     method = "spearman")

cat("Spearman Correlation:", spearman_corr, "\n")

# Kendall Correlation
kendall_corr <- cor(mtcars$mpg,
                    mtcars$wt,
                    method = "kendall")

cat("Kendall Correlation:", kendall_corr)