temp <- read.table("household_power_consumption.txt",sep=";",header=T,nrows = 10)
electric <- read.table("household_power_consumption.txt",sep=";", skip=66637, nrows=2880,col.names=names(temp))
check<-paste(electric$Date,electric$Time,sep=" ")
electric2<- electric[,c(3,4,5,6,7,8,9)]
electric2[electric2 == "?"] <- NA
electric2$DTime <- strptime(check,"%d/%m/%Y %H:%M:%S")
electric2 <- electric2[,c(8,1,2,3,4,5,6,7)]

#png(file = "plot1.png")
#hist(electric2$Global_active_power, xlab = "Global Active Power (kilowatts)",
#				main = "Global Active Power",col="red")
#dev.off()

#png(file = "plot2.png")
#plot(electric2$DTime,electric2$Global_active_power,xlab = "",
#		ylab="Global Active Power (kilowatts)",type="l")
#dev.off()

#png(file = "plot3.png")
#with(electric2, plot(DTime, Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering"))
#with(electric2, lines(DTime, Sub_metering_2, col = "red"))
#with(electric2, lines(DTime, Sub_metering_3, col = "blue"))
#legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
#dev.off()

png(file = "plot4.png")
par(mfrow = c(2,2))
plot(electric2$DTime,electric2$Global_active_power,xlab = "",
		ylab="Global Active Power",type="l")
plot(electric2$DTime,electric2$Voltage,xlab = "datetime",
		ylab="Voltage",type="l")
with(electric2, plot(DTime, Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering"))
with(electric2, lines(DTime, Sub_metering_2, col = "red"))
with(electric2, lines(DTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
plot(electric2$DTime,electric2$Global_reactive_power,xlab = "datetime",
		ylab="Global_reactive_power",type="l")
dev.off()