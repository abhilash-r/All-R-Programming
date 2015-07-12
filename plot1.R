
## Fetches all the dataset
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

## Take data between "2007-02-01" & "2007-02-02"
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Combine Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")
# Plot the graph
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


