## Copy household_power_consumption.txt into the current working directory
#read the file into fileData
fileData <- read.table("household_power_consumption.txt", na.strings="?",
                   sep=";", header=TRUE,stringsAsFactors=FALSE)
#set the Date format
fileData$Date <- as.Date(fileData$Date, format="%d/%m/%Y")

#subsetting the fileData that we want to focus on
fileData <- subset(fileData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#converting the date format
datetime <- paste(as.Date(fileData$Date), fileData$Time)
fileData$Datetime <- as.POSIXct(datetime)

#plotting using plot 
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(fileData, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="datetime")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="datetime")
})

#save the file to plot4.png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()