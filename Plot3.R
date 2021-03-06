library(tidyverse)

data <- read.csv(file = "household_power_consumption.txt", 
                 sep = ";", header = T)

power <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

power$Date <- as.Date(power$Date, format = "%d/%m/%y")
power$Time <- strptime(power$Time, format = "%H:%M:%S")
power[1:1440,"Time"] <- format(power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power[1441:2880,"Time"] <- format(power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(power$Time,power$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(power, lines(Time, as.numeric(as.character(Sub_metering_1))))
with(power, lines(Time, as.numeric(as.character(Sub_metering_2)), col = "red"))
with(power, lines(Time, as.numeric(as.character(Sub_metering_3)), col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       lty = 1,
       )

title(main="Sub Meter Readings from 2/2/2007 to 2/3/2007")

dev.copy(png, filename="plot3.png")
dev.off()


