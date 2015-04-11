
source("download_data.R")

# own function for reading data. Reduces code duplication.
sData <- readData()

png("plot3.png")

par(bg="transparent")


plot(sData$DateTime, sData$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(sData$DateTime, sData$Sub_metering_2, col="red")
lines(sData$DateTime, sData$Sub_metering_3, col="blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"), 
       lty=1)


dev.off()
print("Done!")
