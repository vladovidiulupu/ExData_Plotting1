source("downloadAndSubsetData.R")
data <- downloadAndSubsetData(verbose = TRUE)

png("plot3.png", width = 480, height = 480)

with(data, { 
     plot(DateTime, Sub_metering_1,
          type = "l",
          xlab = "",
          ylab = "Energy sub metering")
     lines(DateTime, Sub_metering_2,
           col = "red")
     lines(DateTime, Sub_metering_3,
           col = "blue")
     legend("topright",
            c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            lty = c(1, 1, 1),
            lwd = c(1, 1, 1),
            col = c("black", "red", "blue"))
     })

dev.off()