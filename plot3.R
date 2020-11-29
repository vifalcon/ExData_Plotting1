library(dplyr)

data<-read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
data<-mutate(data, datetime = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
data<-mutate(data, Date = as.Date(Date, tryFormats = ("%d/%m/%Y")))
sub<-subset(data, data$Date > as.Date("2007-1-31"))
sub<-subset(sub, sub$Date < as.Date("2007-2-3"))


with(sub, plot(datetime, Sub_metering_1, type = "l", xlab =  "", ylab = "Energy sub metering"))
lines(sub$datetime, sub$Sub_metering_2, col = "red")
lines(sub$datetime, sub$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.copy(png, file = "plot3.png")
dev.off()