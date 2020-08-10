### Plot 4

# Loading the data
epcdata <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")
epcdata$Date <- format(as.Date(epcdata$Date, format="%d/%m/%Y"), "%Y-%m-%d")
head(epcdata)
epc <- subset(epcdata, Date=="2007-02-01" | Date=="2007-02-02")
epc$DateTime <- as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S")

png(file="plot4.png", width=480, height=480)

par(mfrow=c(2,2))
# Plot 4-1
plot(epc$DateTime, epc$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot 4-2
plot(epc$DateTime, epc$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 4-3
plot(epc$DateTime, epc$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(epc$DateTime, epc$Sub_metering_1, col="black")
lines(epc$DateTime, epc$Sub_metering_2, col="red")
lines(epc$DateTime, epc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), bty="n", cex=.5)

# Plot 4-4
plot(epc$DateTime, epc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
