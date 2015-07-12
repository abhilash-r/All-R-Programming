
## Fetches all the dataset
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

## Take data between "2007-02-01" & "2007-02-02"
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Combine Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Plot the graph
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(data$DateTime, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")
plot(data$DateTime, data$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")
plot(data$DateTime, data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
op <- par(cex=.4)
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,bty="n", text.font=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
par(op)
plot(data$DateTime, data$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_Power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

