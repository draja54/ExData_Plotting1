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
# 
# #plotting using plot function
plot(fileData$Global_active_power~fileData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#save the file to plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()