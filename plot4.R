
inData <- read.table("household_power_consumption.txt", sep=";", na.strings="?", dec=".", stringsAsFactors=FALSE, header=TRUE)

cleanData <- inData[which(inData$Global_active_power!="?"),]
cleanData$newdate <- strptime(as.character(cleanData$Date), "%d/%m/%Y")  
cleanData[[10]] <- as.Date(cleanData[[10]])

cleanDataFeb <- subset(cleanData, newdate > "2007-01-31 23:59:59")
cleanDataFebruary <- subset(cleanDataFeb, newdate < "2007-02-03 00:00:00") 

attach(mtcars)
par(mfrow=c(2,2))
plot(cleanDataFebruary$Global_active_power, ylab="Global Active Power", xaxt='n', type='l', xlab="") 
axis(1, at=c(1,nrow(cleanDataFebruary)/2,nrow(cleanDataFebruary)),labels=c("Thu","Fri","Sat"))


plot(cleanDataFebruary$Voltage, ylab="Voltage", xlab="datetime", xaxt='n', type='l')
axis(1, at=c(1,nrow(cleanDataFebruary)/2,nrow(cleanDataFebruary)),labels=c("Thu","Fri","Sat"))

plot(cleanDataFebruary$Sub_metering_1, ylab="Energy sub metering", xaxt='n', type='l', xlab="") 
lines(cleanDataFebruary$Sub_metering_2, col="red", xaxt='n', type='l',xlab="") 
lines(cleanDataFebruary$Sub_metering_3, col="blue", xaxt='n', type='l',xlab="")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black", "blue","red"), bty='n')
axis(1, at=c(1,nrow(cleanDataFebruary)/2,nrow(cleanDataFebruary)),labels=c("Thu","Fri","Sat"))


plot(cleanDataFebruary$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", xaxt='n', type='l')
axis(1, at=c(1,nrow(cleanDataFebruary)/2,nrow(cleanDataFebruary)),labels=c("Thu","Fri","Sat"))


dev.copy(png, "Plot4.png")
dev.off()
