
source("download_data.R")

# own function for reading data. Reduces code duplication.
sData <- readData()

png("plot1.png")

par(bg="transparent")

hist(sData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()

print("Done!")
