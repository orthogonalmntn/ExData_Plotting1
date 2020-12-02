## Plot 2

power <- read.table("household_power_consumption.txt", sep=";", 
	na.strings="?", header=TRUE)

power$Date <- as.Date(strptime(power$Date, "%d/%m/%Y"))
subset_power <- power[(power$Date == "2007-02-01" | power$Date == "2007-02-02"),]

datetime_col <- paste(subset_power$Date, subset_power$Time)
subset_power$datetime <- as.POSIXlt(datetime_col)

plot(subset_power$datetime, subset_power$Global_active_power, 
	pch=19, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()
