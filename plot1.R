rawdata <- read.table("household_power_consumption.txt", sep = ";", header = T)
lapply(rawdata, class)
data <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()