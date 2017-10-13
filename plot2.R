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
## Creating a time series for Global Active Power
with(housePowerSubset, plot(timestamp, Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)"))
## Creating "plot2.png"
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()