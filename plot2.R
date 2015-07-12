
## Fetches all the dataset
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

## Take data between "2007-02-01" & "2007-02-02"
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Combine Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")
# Plot the graph
plot(data$DateTime, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
