data <- read.table("household_power_consumption.txt",header=T, sep=";", na.strings = "?")
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()