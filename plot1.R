## Plot 1:

power <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
power$Date <- as.Date(strptime(power$Date, "%d/%m/%Y"))
subset_power <- power[(power$Date == "2007-02-01" | power$Date == "2007-02-02"),]

hist(subset_power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off()