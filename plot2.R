data <- read.table("household_power_consumption.txt",
                   sep = ";", header = TRUE)

##Subset to dates of interest and convert date
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[ which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
View(data)

data <- transform(data, 
                 Global_active_power = as.numeric(as.character(Global_active_power)))

plot(data$DateTime, data$Global_active_power,
     type = "l",
     ylab = "", xlab = "")
