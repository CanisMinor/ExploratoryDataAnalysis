
inData <- read.table("household_power_consumption.txt", sep=";", na.strings="?", dec=".", stringsAsFactors=FALSE, header=TRUE)

cleanData <- inData[which(inData$Global_active_power!="?"),]
cleanData$newdate <- strptime(as.character(cleanData$Date), "%d/%m/%Y")  
cleanData[[10]] <- as.Date(cleanData[[10]])

cleanDataFeb <- subset(cleanData, newdate > "2007-01-31 23:59:59")
cleanDataFebruary <- subset(cleanDataFeb, newdate < "2007-02-03 00:00:00") 

#cleanDataFebruary$newdate <- weekdays(as.Date(cleanDataFebruary$newdate))

plot(cleanDataFebruary$Global_active_power, ylab="Global Active Power (kilowatts)", xaxt='n', type='l', xlab="") 
axis(1, at=c(1,nrow(cleanDataFebruary)/2,nrow(cleanDataFebruary)),labels=c("Thu","Fri","Sat"))

dev.copy(png, "Plot2.png")
dev.off()
