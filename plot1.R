data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data[,1]<-as.Date(data[,1], "%d/%m/%Y")
subset <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

for(i in 3:9) {
        subset[,i] <- as.numeric(as.character(subset[,i]))
}

subset$DateTime <- strptime(paste(as.character(subset[,1]),as.character(subset[,2]), sep=" ")
      , "%Y-%m-%d %H:%M:%S")

#############

##Plot 1
png("plot1.png")
hist(subset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power")
dev.off()