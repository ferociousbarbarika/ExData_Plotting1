data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
sub <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
sub$Date <- as.POSIXct(paste(as.Date(sub$Date, "%d/%m/%Y"),sub$Time))
png("plot4.png", width = 480, height = 480)

# Setting up the Grid and Margins
par(mfrow=c(2,2),mar=c(4,4,2,2))

# Plot 1
plot(x = sub$Date,y = sub$Global_active_power, type="l", ylab = "Global Active Power",xlab = "")

# Plot 2
plot(x = sub$Date,y = sub$Voltage, type="l", ylab = "Voltage",xlab = "datetime")

# Plot 3
plot(sub$Date, sub$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
lines(sub$Date, sub$Sub_metering_2, type = "l", col = "red")
lines(sub$Date, sub$Sub_metering_3, type = "l", col = "blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 2,bty="n",cex = 0.9,col=c("black","red","blue"))

#Plot 4
plot(x = sub$Date,y = sub$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab = "")

dev.off()
