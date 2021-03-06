### PLOT 3
#read rawdata
data <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrow = 2880, na.strings = "?")
colnames(data)=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#format date and time
data$fullTime <- paste(data$Date, data$Time)
data$fullTime <- strptime(data$fullTime, format = "%d/%m/%Y %H:%M:%S")

#create empty plot
par(mar = c(2,4,2,2))
plot(data$fullTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")

#add lines
lines(data$fullTime, data$Sub_metering_1, col = "black")
lines(data$fullTime, data$Sub_metering_2, col = "red")
lines(data$fullTime, data$Sub_metering_3, col = "blue")

#add legend
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#save png file
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()