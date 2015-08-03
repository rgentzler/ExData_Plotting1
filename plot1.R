setwd("C:/Users/gent7553/Documents/GitHub/Exp-Data-Analysis")
data <- read.table("household_power_consumption.txt",
                   sep = ";", header = TRUE)

##Subset to dates of interest and convert date
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[ which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]

gap <- transform(data, 
                 Global_active_power = as.numeric(as.character(Global_active_power)))

hist(gap$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

