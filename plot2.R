rawdata <- read.table("household_power_consumption.txt", sep = ";", header = T)

data <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

Sys.setlocale("LC_TIME", "English")
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480)
plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()