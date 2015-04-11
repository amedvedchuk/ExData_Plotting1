
source("download_data.R")

# own function for reading data. Reduces code duplication.
sData <- readData()


png("plot4.png")

par(bg="transparent")
par(mfrow = c(2,2))

with( sData, {
    
    plot(sData$DateTime, sData$Global_active_power, type="l", 
         ylab = "Global Active Power", xlab = "")
    
    plot(sData$DateTime, sData$Voltage, type="l", 
         ylab = "Voltage", xlab = "datetime")
    
    plot(sData$DateTime, sData$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
    lines(sData$DateTime, sData$Sub_metering_2, col="red")
    lines(sData$DateTime, sData$Sub_metering_3, col="blue")
    legend("topright", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col=c("black","red","blue"), 
           lty=1, bty="n")
    
    plot(sData$DateTime, sData$Global_reactive_power, type="l", 
         ylab = "Global_reactive_power", xlab = "datetime")
    
    
}
)

dev.off()
print("Done!")
