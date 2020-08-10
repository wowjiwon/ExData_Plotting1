### Plot 2

# Loading the data
epcdata <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")
epcdata$Date <- format(as.Date(epcdata$Date, format="%d/%m/%Y"), "%Y-%m-%d")
head(epcdata)
epc <- subset(epcdata, Date=="2007-02-01" | Date=="2007-02-02")
epc$DateTime <- as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S")

png(file="plot2.png", width=480, height=480)
plot(epc$DateTime, epc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
