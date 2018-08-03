data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
sub <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
sub$Date <- as.POSIXct(paste(as.Date(sub$Date, "%d/%m/%Y"),sub$Time))
png("plot3.png", width = 480, height = 480)
plot(sub$Date, sub$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
lines(sub$Date, sub$Sub_metering_2, type = "l", col = "red")
lines(sub$Date, sub$Sub_metering_3, type = "l", col = "blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 2,col=c("black","red","blue"))
dev.off()
