cols = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric')
data <- read.table(unz("data.zip", "household_power_consumption.txt"), header=T, sep=";", colClasses=cols, na.strings='?')
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

library(data.table)
data <- data.table(data)

data <- data[Date %in% c("1/2/2007","2/2/2007")]


png("plot2.png", height=480, width=480)

plot(data$DateTime, data$Global_active_power, pch=NA, xlab="",ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

dev.off()