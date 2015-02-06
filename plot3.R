data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data[,1]<-as.Date(data[,1], "%d/%m/%Y")
subset <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

for(i in 3:9) {
        subset[,i] <- as.numeric(as.character(subset[,i]))
}

subset$DateTime <- strptime(paste(as.character(subset[,1]),as.character(subset[,2]), sep=" ")
                            , "%Y-%m-%d %H:%M:%S")

#############

##Plot 3
png("plot3.png")
plot(subset$DateTime, subset$Sub_metering_1, type="n",
     xlab="", ylab="Energy sub metering")
lines(subset$DateTime, subset$Sub_metering_1, type="l", col="black")
lines(subset$DateTime, subset$Sub_metering_2, type="l", col="red")
lines(subset$DateTime, subset$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()






