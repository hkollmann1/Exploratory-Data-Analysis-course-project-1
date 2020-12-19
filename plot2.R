data2 <- read.table("./data/household_power_consumption.txt", header = TRUE,sep = ";",dec=".")
subData2 <- data2[data2$Date %in% c("1/2/2007","2/2/2007"),]

GlobalActivePower <- as.numeric(subData2$Global_active_power)
datetime <- strptime(paste(subData2$Date, subData2$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(datetime,GlobalActivePower,type = "l", xlab = " ", ylab = "Global Active Power(Kilowatts)")
dev.off