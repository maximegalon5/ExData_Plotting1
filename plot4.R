## After downloading dataset and unzipping the required file into the working directory.
## Loading data set into cache
housePowerData <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
## Creating a subset of the data for the desired time period
tempSubset1 <- subset.data.frame(housePowerData, na.rm = TRUE, Date =="1/2/2007")
tempSubset2 <-subset.data.frame(housePowerData, na.rm = TRUE, Date =="2/2/2007")
housePowerSubset <- rbind(tempSubset1, tempSubset2)
##Adding additional date/time column with "%d/%m/%Y %H:%M:%S" format
housePowerSubset$Date<- as.Date(housePowerSubset$Date, format="%d/%m/%Y")
housePowerSubset <- transform(housePowerSubset, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
##Creating a 4 X 4 graphic combining existing plots (2 and 3) with a time series of Global Reactive Power and Voltage
##Creating grid
par(mfrow = c(2,2))
##Upper Left
with(housePowerSubset, plot(timestamp, Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)"))
##Upper Right
with(housePowerSubset, plot(timestamp,Voltage, type="l", xlab="datetime", ylab="Voltage"))
##Lower Right
with(housePowerSubset, plot(timestamp, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(housePowerSubset, lines(timestamp, Sub_metering_2,col="red"))
with(housePowerSubset, lines(timestamp, Sub_metering_3,col="blue"))
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1), bty = "n",cex = 0.6)
##Lower Left
with(housePowerSubset, plot(timestamp, Global_reactive_power, xlab = "datetime", type = "l"))
##Creating the png "plot4.png"
dev.copy(png, file="plot4.png", width= 480, height = 480)
dev.off()
#Resetting plot space
par(mfrow = c(1,1))
