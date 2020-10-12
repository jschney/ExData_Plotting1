library(tidyverse)

data <- read.csv(file = "household_power_consumption.txt", 
                 sep = ";", header = T)

power <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

hist(as.numeric(as.character(power$Global_active_power))
     ,col="red",main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)")

title(main="Global Active Power")

dev.copy(png, filename="plot1.png")
dev.off()


