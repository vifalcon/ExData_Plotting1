library(dplyr)

data<-read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
data<-mutate(data, datetime = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
data<-mutate(data, Date = as.Date(Date, tryFormats = ("%d/%m/%Y")))
sub<-subset(data, data$Date > as.Date("2007-1-31"))
sub<-subset(sub, sub$Date < as.Date("2007-2-3"))

hist(as.numeric(sub$Global_active_power), 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "red")

png(file = "plot1.png")
dev.off()