###PLOT 1
#read rawdata
data <- read.table(file = "./household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrow = 2880, na.strings = "?")
colnames(data)=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data$Date <- strptime(data$Date, format = "%d/%m/%Y")
str(data)

#create plot1
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#save png file
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()