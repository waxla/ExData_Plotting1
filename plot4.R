rawdata <- read.table("household_power_consumption.txt", sep = ";", header = T)
lapply(rawdata, class)
data <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007")

#Convert factor type variables into numeric type. #
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

Sys.setlocale("LC_TIME", "English")
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(data$Date, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$Date, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Date, data$Sub_metering_2, col = "red")
lines(data$Date, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
plot(data$Date, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
