## Plot 4:

power <- read.table("household_power_consumption.txt", sep=";", 
	na.strings="?", header=TRUE)

power$Date <- as.Date(strptime(power$Date, "%d/%m/%Y"))
subset_power <- power[(power$Date == "2007-02-01" | power$Date == "2007-02-02"),]

datetime_col <- paste(subset_power$Date, subset_power$Time)
subset_power$datetime <- as.POSIXlt(datetime_col)

par(mfrow = c(2,2))

## Sub-plot 1:

plot(subset_power$datetime, subset_power$Global_active_power, 
	type = "l", xlab = "", ylab = "Global Active Power")

## Sub-plot 2:

plot(subset_power$datetime, subset_power$Voltage,
	type = "l", xlab = "datetime", ylab = "Voltage")

## Sub-plot 3:

plot(subset_power$datetime, subset_power$Sub_metering_1, 
	type="l", xlab="", ylab="Energy sub metering")

points(subset_power$datetime, subset_power$Sub_metering_2,
	col="red", type="l")
points(subset_power$datetime, subset_power$Sub_metering_3,
	col="blue", type="l")

legend("topright", lty = 1, 
	col = c("black", "red", "blue"),
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Sub-plot 4:

plot(subset_power$datetime, subset_power$Global_reactive_power,
	type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()
