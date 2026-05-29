# Load Dataset
student_data <- read.csv("projects/Student_Performance_Analysis/dataset.csv")

# View Dataset
head(student_data)

# Structure
str(student_data)

# Summary Statistics
summary(student_data)

# Mean Final Score
cat("Average Final Score:",
    mean(student_data$Final_Score),
    "\n")

# Median Final Score
cat("Median Final Score:",
    median(student_data$Final_Score),
    "\n")

# Standard Deviation
cat("SD:",
    sd(student_data$Final_Score),
    "\n")

# Correlation Analysis
correlation <- cor(
  student_data[,c("Study_Hours",
                  "Attendance",
                  "Previous_Score",
                  "Final_Score")]
)

print(correlation)

# Linear Regression
model <- lm(Final_Score ~ Study_Hours +
              Attendance +
              Previous_Score,
            data = student_data)

summary(model)

# Prediction Example
new_student <- data.frame(
  Study_Hours=7,
  Attendance=95,
  Previous_Score=85
)

predict(model,new_student)

# ------------------
# Chart 1 : Score Distribution
# ------------------

# Create Histogram Image

png("projects/Student_Performance_Analysis/charts/score_distribution.png")

hist(student_data$Final_Score,
     main = "Distribution of Final Scores",
     xlab = "Final Score")

dev.off()


# ------------------
# Chart 2 : Study Hours vs Final Score
# ------------------


png("projects/Student_Performance_Analysis/charts/studyhours_vs_score.png")

plot(student_data$Study_Hours,
     student_data$Final_Score,
     main="Study Hours vs Final Score",
     xlab="Study Hours",
     ylab="Final Score")

abline(
  lm(Final_Score ~ Study_Hours,
     data=student_data),
  lwd=2
)

dev.off()


# ------------------
# Chart 3 : Gender Performance
# ------------------

png("projects/Student_Performance_Analysis/charts/gender_performance.png")

boxplot(
  Final_Score ~ Gender,
  data=student_data,
  main="Gender Performance Comparison"
)

dev.off()


# ------------------
# Chart 4 : Correlation Heatmap
# ------------------


numeric_data <- student_data[, c(
  "Study_Hours",
  "Attendance",
  "Previous_Score",
  "Final_Score"
)]

corr_matrix <- cor(numeric_data)

# Save High Quality Heatmap

png(
  "projects/Student_Performance_Analysis/charts/correlation_heatmap.png",
  width = 1200,
  height = 1000,
  res = 150
)

heatmap(
  corr_matrix,
  Rowv = NA,
  Colv = NA,
  scale = "none",
  margins = c(8,8),
  main = "Correlation Heatmap"
)

dev.off()











