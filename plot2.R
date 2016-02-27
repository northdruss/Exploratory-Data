## Set Working Directory
setwd("C:/Users/Aegis/Documents/Exploratory Data")
## Ingest all data from source and make sure values are numeric
alldata = read.table("household_power_consumption.txt", header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = "?")

##Subset two days of data that are required.
mydata = subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")

##Format the Date and Time values
datetime <- strptime(paste(mydata$Date, mydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
##Extract variable for plot
globalActivePower <- mydata$Global_active_power
##Create line plot
plot(datetime,globalActivePower, type ="l", ylab = "Global Active Power (kilowatts)", xlab="")
##Create PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()