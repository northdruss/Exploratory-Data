## Set Working Directory
setwd("C:/Users/Aegis/Documents/Exploratory Data")
## Ingest all data from source and make sure values are numeric
alldata = read.table("household_power_consumption.txt", header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = "?")
##Subset two days of data that are required.
mydata = subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
##Draw histogram plot
hist(mydata$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power")
##Create PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()