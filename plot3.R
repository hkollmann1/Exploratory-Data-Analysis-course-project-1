data3 <- read.table("./data/household_power_consumption.txt", header = TRUE,sep = ";",dec=".")
subData3 <- data3[data3$Date %in% c("1/2/2007","2/2/2007"),]

GlobalActivePower <- as.numeric(subData3$Global_active_power)
datetime <- strptime(paste(subData3$Date, subData3$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
submetering1 <- as.numeric(subData3$Sub_metering_1)
submetering2 <- as.numeric(subData3$Sub_metering_2)
submetering3 <- as.numeric(subData3$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(datetime,submetering1,type = "l", xlab = " ", ylab = "Energy Submetering")
lines(submetering2,type = "l", col="red")
lines(submetering3,type = "l", col= "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"))
dev.off