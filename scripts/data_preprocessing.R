data(airquality)

# View Missing Values
colSums(is.na(airquality))

# Remove Missing Values
clean_data <- na.omit(airquality)

# Display Structure
str(clean_data)

# Normalize Numeric Columns
numeric_data <- clean_data[, c("Ozone",
                               "Solar.R",
                               "Wind",
                               "Temp")]

scaled_data <- scale(numeric_data)

head(scaled_data)