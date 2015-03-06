dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gActivePower <- as.numeric(subData$Global_active_power)
sMeter1 <- as.numeric(subData$Sub_metering_1)
sMeter2 <- as.numeric(subData$Sub_metering_2)
sMeter3 <- as.numeric(subData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sMeter1, type = "l", ylab = "Energy Sub metering", xlab = "")
lines(datetime, sMeter2, type="l", col="red")
lines(datetime, sMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col = c("black", "red", "blue"))
dev.off()



