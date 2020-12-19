data4 <- read.table("./data/household_power_consumption.txt", header = TRUE,sep = ";",dec=".")
subData4 <- data4[data4$Date %in% c("1/2/2007","2/2/2007"),]

GlobalActivePower <- as.numeric(subData4$Global_active_power)
GlobalReactivePower <- as.numeric(subData4$Global_reactive_power)
voltage <- as.numeric(subData4$Voltage)
datetime <- strptime(paste(subData4$Date, subData4$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
submetering1 <- as.numeric(subData4$Sub_metering_1)
submetering2 <- as.numeric(subData4$Sub_metering_2)
submetering3 <- as.numeric(subData4$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(datetime,GlobalActivePower,type = "l", xlab = " ", ylab = "Global Active Power(Kilowatts)", cex=0.2)

plot(datetime,voltage,type = "l", xlab = "Datetime", ylab = "Voltage")


plot(datetime,submetering1,type = "l", xlab = " ", ylab = "Energy Submetering")
lines(submetering2,type = "l", col="red")
lines(submetering3,type = "l", col= "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"), bty="o")

plot(datetime,GlobalReactivePower,type = "l", xlab = "Datetime", ylab = "Global Reactive Power")

dev.off