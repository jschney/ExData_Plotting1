library(tidyverse)

data <- read.csv(file = "household_power_consumption.txt", 
                 sep = ";", header = T)

power <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

power$Date <- as.Date(power$Date, format = "%d/%m/%y")
power$Time <- strptime(power$Time, format = "%H:%M:%S")
power[1:1440,"Time"] <- format(power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power[1441:2880,"Time"] <- format(power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(power$Time,as.numeric(as.character(power$Global_active_power)),
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)") 


title(main="Global Active Power from 2/2/2007 to 2/3/2007")

dev.copy(png, filename="plot2.png")
dev.off()


