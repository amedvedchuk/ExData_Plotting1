
source("download_data.R")

# own function for reading data. Reduces code duplication.
sData <- readData()

png("plot2.png")

par(bg="transparent")

plot(sData$DateTime, sData$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
print("Done!")
