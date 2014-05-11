cols = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric')
data <- read.table(unz("data.zip", "household_power_consumption.txt"), header=T, sep=";", stringsAsFactors=F, colClasses=cols, na.strings='?')
library(data.table)
data <- data.table(data)

data <- data[Date %in% c("1/2/2007","2/2/2007")]

png("plot1.png", height=480, width=480, bg="transparent")

hist(data$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

dev.off()