source("downloadAndSubsetData.R")
data <- downloadAndSubsetData(verbose = TRUE)

png("plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2), pch = 20, lwd = 0.5)

# plot at (1,1)
with(data, {
    plot(DateTime, Global_active_power,
                type = "l",
                xlab = "",
                ylab = "Global Active Power")
    })

# plot at (2,1)
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
           cex = 0.9,
           bty = "n",
           x.intersp = 0.9,
           y.intersp = 1,
           col = c("black", "red", "blue"))
    })

# plot at (1,2)
with(data, {
    plot(DateTime, Voltage,
                type = "l",
                xlab = "datetime",
                ylab = "Voltage")
    })

# plot at (2,2)
with(data, {
    plot(DateTime, Global_reactive_power,
                type = "o",
                cex = 0.2,
                xlab = "datetime",
                ylab = "Global_reactive_power")
    })

dev.off()