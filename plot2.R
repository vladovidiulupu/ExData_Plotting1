source("downloadAndSubsetData.R")
data <- downloadAndSubsetData(verbose = TRUE)

png("plot2.png", width = 480, height = 480)

with(data, plot(DateTime, Global_active_power,
                type = "l",
                xlab = "",
                ylab = "Global Active Power (kilowatts)"))
dev.off()