rawdata <- read.table("household_power_consumption.txt", sep = ";", header = T)
data <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007")


Sys.setlocale("LC_TIME", "English")
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#As the class of variables "Sub_metering_1" and "Sub_metering_2" are factor, convert them into numeric type. Variable "Sub_metering_3" was read as numeric type.# 
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))

png(filename = "plot3.png", width = 480, height = 480)
plot(data$Date, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Date, data$Sub_metering_2, col = "red")
lines(data$Date, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), )
dev.off()