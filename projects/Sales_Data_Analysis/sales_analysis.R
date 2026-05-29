# Load Dataset

sales_data <- read.csv(
  "projects/Sales_Data_Analysis/sales_data.csv"
)

# View Data

head(sales_data)

# Structure

str(sales_data)

# Summary

summary(sales_data)

# Total Sales

cat(
  "Total Sales:",
  sum(sales_data$Sales),
  "\n"
)

# Average Sales

cat(
  "Average Sales:",
  mean(sales_data$Sales),
  "\n"
)

# Total Profit

cat(
  "Total Profit:",
  sum(sales_data$Profit),
  "\n"
)

# Correlation

correlation <- cor(
  sales_data[,c("Sales","Profit")]
)

print(correlation)

#------------------------------
# Chart 1 — Monthly Sales Trend
#------------------------------
png(
  "projects/Sales_Data_Analysis/charts/monthly_sales.png",
  width=1200,
  height=800,
  res=150
)

plot(
  sales_data$Sales,
  type="o",
  xaxt="n",
  main="Monthly Sales Trend",
  xlab="Month",
  ylab="Sales"
)

axis(
  1,
  at=1:12,
  labels=sales_data$Month
)

dev.off()


#------------------------------
# Chart 2 — Profit Distribution
#------------------------------
png(
  "projects/Sales_Data_Analysis/charts/profit_distribution.png",
  width=1200,
  height=800,
  res=150
)

hist(
  sales_data$Profit,
  main="Profit Distribution",
  xlab="Profit"
)

dev.off()


#------------------------------
# Chart 3 — Sales by Region
#------------------------------
region_sales <- aggregate(
  Sales ~ Region,
  data=sales_data,
  sum
)

png(
  "projects/Sales_Data_Analysis/charts/sales_by_region.png",
  width=1200,
  height=800,
  res=150
)

barplot(
  region_sales$Sales,
  names.arg=region_sales$Region,
  main="Sales by Region"
)

dev.off()


#------------------------------
# Chart 4 — Sales vs Profit
#------------------------------
png(
  "projects/Sales_Data_Analysis/charts/sales_vs_profit.png",
  width=1200,
  height=800,
  res=150
)

plot(
  sales_data$Sales,
  sales_data$Profit,
  main="Sales vs Profit",
  xlab="Sales",
  ylab="Profit"
)

abline(
  lm(Profit ~ Sales,
     data=sales_data),
  lwd=2
)

dev.off()
















