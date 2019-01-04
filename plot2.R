####PLOT 2
#read rawdata
data <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrow = 2880, na.strings = "?")
colnames(data)=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#format date and time
data$fullTime <- paste(data$Date, data$Time)
data$fullTime <- strptime(data$fullTime, format = "%d/%m/%Y %H:%M:%S")

#create plot2
par(mar = c(2,4,2,2))
plot(data$fullTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#save png file
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()