library(dplyr)

data<-read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
data<-mutate(data, datetime = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
data<-mutate(data, Date = as.Date(Date, tryFormats = ("%d/%m/%Y")))
sub<-subset(data, data$Date > as.Date("2007-1-31"))
sub<-subset(sub, sub$Date < as.Date("2007-2-3"))


par(mfcol=c(2,2))

with(sub, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
#plot1_1

with(sub, plot(datetime, Sub_metering_1, type = "l", xlab =  "", ylab = "Energy sub metering"))
lines(sub$datetime, sub$Sub_metering_2, col = "red")
lines(sub$datetime, sub$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1, 
       box.lty = 0, 
       cex = 0.8)
#plot2_1


with(sub, plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
#plot1_2

with(sub, plot(datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
#plot2_2

dev.copy(png, file = "plot4.png")
dev.off()