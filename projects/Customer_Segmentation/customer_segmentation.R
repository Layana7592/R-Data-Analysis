customer_data <- read.csv(
  "projects/Customer_Segmentation/customer_data.csv"
)

head(customer_data)
summary(customer_data)

# K-Means Clustering
# <<<-------------->>>
set.seed(123)

customer_features <- customer_data[, c(
  "Annual_Income",
  "Spending_Score"
)]

kmeans_result <- kmeans(
  customer_features,
  centers = 3
)

customer_data$Cluster <- as.factor(
  kmeans_result$cluster
)

print(kmeans_result)


# Visualization 1: Annual Income Distribution
png(
  "projects/Customer_Segmentation/charts/annual_income_distribution.png",
  width=1400,
  height=900,
  res=180
)

hist(
  customer_data$Annual_Income,
  col="steelblue",
  border="white",
  main="Annual Income Distribution",
  xlab="Annual Income (k$)",
  ylab="Frequency"
)

grid()

dev.off()


# Visualization 2: Spending Score Distribution
png(
  "projects/Customer_Segmentation/charts/spending_score_distribution.png",
  width=1400,
  height=900,
  res=180
)

hist(
  customer_data$Spending_Score,
  col="darkseagreen3",
  border="white",
  main="Spending Score Distribution",
  xlab="Spending Score",
  ylab="Frequency"
)

grid()

dev.off()


# Visualization 3: Customer Clusters (Main Chart)
png(
  "projects/Customer_Segmentation/charts/customer_clusters.png",
  width=1600,
  height=1000,
  res=200
)

plot(
  customer_data$Annual_Income,
  customer_data$Spending_Score,
  col=customer_data$Cluster,
  pch=19,
  cex=2,
  main="Customer Segmentation Using K-Means Clustering",
  xlab="Annual Income (k$)",
  ylab="Spending Score"
)

legend(
  "bottomright",
  legend=c(
    "Cluster 1",
    "Cluster 2",
    "Cluster 3"
  ),
  col=1:3,
  pch=19,
  cex=1.2
)

grid()

dev.off()


# Visualization 4: Cluster Summary
cluster_count <- table(
  customer_data$Cluster
)

png(
  "projects/Customer_Segmentation/charts/cluster_summary.png",
  width=1400,
  height=900,
  res=180
)

barplot(
  cluster_count,
  col=c(
    "steelblue",
    "tomato",
    "darkseagreen3"
  ),
  main="Customer Count by Cluster",
  xlab="Cluster",
  ylab="Number of Customers"
)

dev.off()
