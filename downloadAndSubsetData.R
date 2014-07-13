downloadAndSubsetData <- function (verbose = FALSE) {
    
    #download the data if it is not available
    if (!file.exists("data/household_power_consumption.txt")) {
        
        if (!file.exists("data"))
            dir.create("data")
    
        if (!file.exists("data/household_power_consumption.zip")) {
            if (verbose) print("Downloading data...")
            fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
            download.file(fileUrl, quiet = !verbose,
                          destfile="./data/household_power_consumption.zip")
        }
        
        if (verbose) print("Decompressing data...")
        unzip("data/household_power_consumption.zip", exdir = "data")
    }
    
    if (verbose) print("Reading data...")
    fullDataset <- read.table("data/household_power_consumption.txt", header = TRUE,
                              sep = ";", na.strings = "?", dec = ".")
    
    #subset the data to only include the 2 required days
    subsettedData <- subset(fullDataset, Date == "1/2/2007" | Date == "2/2/2007")
    
    #convert from strings to POSIX time
    pTimeColumn <- strptime(paste(subsettedData$Date, subsettedData$Time),
                            format = "%d/%m/%Y %H:%M:%S",
                            tz = "GMT")
    
    #remove the two old date/time columns and add the new one
    dateTimeColumnIndices <- which(names(subsettedData) == "Time" | names(subsettedData) == "Date")
    requiredData <- subsettedData[, -dateTimeColumnIndices]
    requiredData <- cbind(pTimeColumn, requiredData)
    names(requiredData)[1] = "DateTime"
    requiredData
}
