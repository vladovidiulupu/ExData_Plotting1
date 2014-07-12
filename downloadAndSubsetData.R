downloadAndSubsetData <- function () {
    
    #download the data if it is not available
    if (!file.exists("data/household_power_consumption.txt")) {
        
        if (!file.exists("data"))
            dir.create("data")
    
        if (!file.exists("data/household_power_consumption.zip")) {
            fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
            download.file(fileUrl, destfile="./data/household_power_consumption.zip")
        }
        
        unzip("data/household_power_consumption.zip", exdir = "data")
    }
    
    #convert to date/time
    fullDataset <- read.table("data/household_power_consumption.txt", header = TRUE,
                              sep = ";", na.strings = "?")
    fullDataset$Date <- as.Date(fullDataset$Date, format = "%d/%m/%Y")
    fullDataset$Time <- strptime(fullDataset$Time, format = "%H:%M:%S")
    
    #subset the data
    date1 <- as.Date("2007-02-01", format = "%Y-%m-%d")
    date2 <- as.Date("2007-02-02", format = "%Y-%m-%d")
    requiredData <- subset(fullDataset, Date == date1 | Date == date2)
    requiredData
}
