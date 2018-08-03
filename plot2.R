data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
sub <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
sub$Date <- as.POSIXct(paste(as.Date(sub$Date, "%d/%m/%Y"),sub$Time))
png("plot2.png", width = 480, height = 480)
plot(x = sub$Date,y = sub$Global_active_power, type="l", ylab = "Global Active Power(kilowatts)",xlab = "")
dev.off()
