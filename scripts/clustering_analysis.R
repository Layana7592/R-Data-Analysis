data(iris)

# Use only numeric columns
iris_numeric <- iris[,1:4]

# K-Means Clustering
set.seed(123)

kmeans_result <- kmeans(iris_numeric,
                        centers = 3)

print(kmeans_result)

# Cluster Plot
plot(iris_numeric[,1:2],
     col = kmeans_result$cluster,
     pch = 19,
     main = "K-Means Clustering")