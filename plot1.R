## After downloading dataset and unzipping the required file into the working directory.
## Loading data set into cache
housePowerData <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
## Creating a subset of the data for the desired time period
tempSubset1 <- subset.data.frame(housePowerData, na.rm = TRUE, Date =="1/2/2007")
tempSubset2 <-subset.data.frame(housePowerData, na.rm = TRUE, Date =="2/2/2007")
housePowerSubset <- rbind(tempSubset1, tempSubset2)
## Creating a Histogram titled "Global Active Power" with the x- axis labelled as "Global Active Power (killowatts), where the y-axis auto-displays to 'frequency' and 
## the color of the columns are red
with(housePowerSubset, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Killowatt)"))
## Creating "plot 1.png"
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()