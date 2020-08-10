### Plot 1

# Loading the data
epcdata <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings="?")
epcdata$Date <- format(as.Date(epcdata$Date, format="%d/%m/%Y"), "%Y-%m-%d")
head(epcdata)
epc <- subset(epcdata, Date=="2007-02-01" | Date=="2007-02-02")

png(file="plot1.png", width=480, height=480)
hist(epc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
