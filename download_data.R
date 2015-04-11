
# data saving parameters
dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dataDir <- "data"
destArchive <- paste(dataDir, "/incoming.zip", sep="")
destUnzipFolder <- paste(dataDir, "/incoming", sep="")

## function for downloading data from external source declared in "dataUrl" variable.
downloadRawData <- function(){
    
    if(!file.exists(dataDir)){
        print(paste("download data from:", dataUrl))
        dir.create(dataDir)
        if(.Platform$OS.type == "windows"){
            download.file(dataUrl, destArchive)
        } else {
            download.file(dataUrl, destArchive, method = "wget")
        }
        print(paste("unzip files to:", destUnzipFolder))
        unzip(zipfile = destArchive, exdir = destUnzipFolder)
    } else {
        print("data already downloaded!")
    }
    
}

readData <- function(){
    downloadRawData()
    print("read data...")
    data<-read.table("data/incoming/household_power_consumption.txt", sep = ";", 
                     na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
    sData <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007' )
    sData$DateTime <- strptime(paste(sData$Date, sData$Time), format="%d/%m/%Y %H:%M:%S")
    sData
}

#