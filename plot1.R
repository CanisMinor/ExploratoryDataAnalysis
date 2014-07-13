
inData <- read.table("household_power_consumption.txt", sep=";", na.strings="?", dec=".", stringsAsFactors=FALSE, header=TRUE)

cleanData <- inData[which(inData$Global_active_power!="?"),]
cleanData$newdate <- strptime(as.character(cleanData$Date), "%d/%m/%Y")  
cleanData[[10]] <- as.Date(cleanData[[10]])

cleanDataFeb <- subset(cleanData, newdate > "2007-01-31 23:59:59")
cleanDataFebruary <- subset(cleanDataFeb, newdate < "2007-02-03 00:00:00") 

hist(cleanDataFebruary$Global_active_power, breaks=20, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

dev.copy(png, "Plot1.png")
dev.off()
