# Load Dataset

healthcare_data <- read.csv(
  "projects/Healthcare_Data_Analysis/healthcare_data.csv"
)

# View Dataset

head(healthcare_data)

# Structure

str(healthcare_data)

# Summary

summary(healthcare_data)

# Average Age

cat(
  "Average Age:",
  mean(healthcare_data$Age),
  "\n"
)

# Average BMI

cat(
  "Average BMI:",
  mean(healthcare_data$BMI),
  "\n"
)

# Correlation

correlation <- cor(
  healthcare_data[,c("Age",
                     "BMI",
                     "Blood_Pressure")]
)

print(correlation)

#----------------------------
# Chart 1 – Age Distribution
#----------------------------

png(
  "projects/Healthcare_Data_Analysis/charts/age_distribution.png",
  width = 1200,
  height = 800,
  res = 150
)

hist(
  healthcare_data$Age,
  col = "skyblue",
  border = "white",
  main = "Age Distribution of Patients",
  xlab = "Age",
  ylab = "Frequency"
)

dev.off()


#----------------------------
# Chart 2 – BMI Distribution
#----------------------------

png(
  "projects/Healthcare_Data_Analysis/charts/bmi_distribution.png",
  width = 1200,
  height = 800,
  res = 150
)

hist(
  healthcare_data$BMI,
  col = "lightgreen",
  border = "white",
  main = "BMI Distribution",
  xlab = "BMI",
  ylab = "Frequency"
)

dev.off()


#----------------------------
# Chart 3 –Disease Frequency
#----------------------------
disease_count <- table(
  healthcare_data$Disease
)

png(
  "projects/Healthcare_Data_Analysis/charts/disease_frequency.png",
  width = 1200,
  height = 800,
  res = 150
)

barplot(
  disease_count,
  col = c("lightgreen", "tomato"),
  main = "Disease Frequency",
  xlab = "Disease Status",
  ylab = "Number of Patients"
)

dev.off()


#----------------------------
# Chart 4 –Age vs BMI
#----------------------------
png(
  "projects/Healthcare_Data_Analysis/charts/age_vs_bmi.png",
  width = 1200,
  height = 800,
  res = 150
)

plot(
  healthcare_data$Age,
  healthcare_data$BMI,
  pch = 19,
  col = "steelblue",
  main = "Age vs BMI",
  xlab = "Age",
  ylab = "BMI"
)

abline(
  lm(BMI ~ Age,
     data = healthcare_data),
  col = "red",
  lwd = 3
)

grid()

dev.off()


#----------------------------
# Chart 5 –Correlation Heatmap
#----------------------------
numeric_data <- healthcare_data[, c(
  "Age",
  "BMI",
  "Blood_Pressure"
)]

corr_matrix <- cor(numeric_data)

png(
  "projects/Healthcare_Data_Analysis/charts/correlation_heatmap.png",
  width = 1400,
  height = 1000,
  res = 180
)

heatmap(
  corr_matrix,
  col = heat.colors(20),
  scale = "none",
  margins = c(8,8),
  main = "Healthcare Correlation Heatmap"
)

dev.off()

















