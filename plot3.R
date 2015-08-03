data <- read.table("household_power_consumption.txt",
                   sep = ";", header = TRUE)

##Subset to dates of interest and convert date
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[ which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
View(data)

data <- transform(data, 
                  Global_active_power = as.numeric(as.character(Global_active_power)),
                  Sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
                  Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
                  Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))


plot(data$DateTime, data$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering", xlab = "", cex.lab = 0.75)
lines(data$DateTime, data$Sub_metering_2,
      type = "l", col="red")
lines(data$DateTime, data$Sub_metering_3,
      type = "l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.75,
       lty = 1,
       col = c("black", "red", "blue"))
