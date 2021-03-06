## Set Working Directory
setwd("C:/Users/Aegis/Documents/Exploratory Data")
## Ingest all data from source and make sure values are numeric
alldata = read.table("household_power_consumption.txt", header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = "?")

##Subset two days of data that are required.
mydata = subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")

##Format the Date and Time values
datetime <- strptime(paste(mydata$Date, mydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
##Extract variable for plot
EneSubMeter1 <- mydata$Sub_metering_1
EneSubMeter2 <- mydata$Sub_metering_2
EneSubMeter3 <- mydata$Sub_metering_3
globalActivePower <- mydata$Global_active_power
globalReactivePower <- mydata$Global_reactive_power
voltage <- mydata$Voltage

##make a 2 by 2 plot area
par(mfrow = c(2,2))

## Create the four plots
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime,EneSubMeter1, type ="l", ylab = "Energy sub metering", xlab="")
lines(datetime,EneSubMeter2, type = "l", col="red")
lines(datetime,EneSubMeter3, type = "l", col="blue")
legend("topright", cex= 1, pt.cex = .75, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd = 2.5, col=c("black", "red", "blue"))
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

##dev.copy left the legend cut off I sent the PNG directly to the device.
png("C:/Users/Aegis/Documents/Exploratory Data/plot4.png", height=480, width=480)
##make a 2 by 2 plot area
par(mfrow = c(2,2))
#Create the four plots
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime,EneSubMeter1, type ="l", ylab = "Energy sub metering", xlab="")
lines(datetime,EneSubMeter2, type = "l", col="red")
lines(datetime,EneSubMeter3, type = "l", col="blue")
legend("topright", cex= 1, pt.cex = .75, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd = 2.5, col=c("black", "red", "blue"))
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()