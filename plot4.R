data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data[,1]<-as.Date(data[,1], "%d/%m/%Y")
subset <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

for(i in 3:9) {
        subset[,i] <- as.numeric(as.character(subset[,i]))
}

subset$DateTime <- strptime(paste(as.character(subset[,1]),as.character(subset[,2]), sep=" ")
                            , "%Y-%m-%d %H:%M:%S")

#############

##Plot 4
png("plot4.png")
par(mfrow=c(2,2))
plot(subset$DateTime,subset$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")
plot(subset$DateTime, subset$Voltage, type="l",
     xlab="datetime", ylab="Voltage")
plot(subset$DateTime, subset$Sub_metering_1, type="n",
     xlab="", ylab="Energy sub metering")
lines(subset$DateTime, subset$Sub_metering_1, type="l", col="black")
lines(subset$DateTime, subset$Sub_metering_2, type="l", col="red")
lines(subset$DateTime, subset$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(subset$DateTime, subset$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")
dev.off()




