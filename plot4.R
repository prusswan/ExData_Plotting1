cols = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric')
data <- read.table(unz("data.zip", "household_power_consumption.txt"), header=T, sep=";", colClasses=cols, na.strings='?')
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

library(data.table)
data <- data.table(data)

data <- data[Date %in% c("1/2/2007","2/2/2007")]



png("plot4.png", height=480, width=480, bg="transparent")
par(mfrow=c(2,2))

plot(data$DateTime, data$Global_active_power, pch=NA, xlab="",ylab="Global Active Power")
lines(data$DateTime, data$Global_active_power)

plot(data$DateTime, data$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(data$DateTime, data$Voltage)

plot(data$DateTime, data$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")

lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
meters <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend('topright', meters, lty = c(1,1,1), col = c('black', 'red', 'blue'), bty = 'n')

with(data, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(data, lines(DateTime, Global_reactive_power))

dev.off()