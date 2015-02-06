data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data[,1]<-as.Date(data[,1], "%d/%m/%Y")
subset <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

for(i in 3:9) {
        subset[,i] <- as.numeric(as.character(subset[,i]))
}

subset$DateTime <- strptime(paste(as.character(subset[,1]),as.character(subset[,2]), sep=" ")
                            , "%Y-%m-%d %H:%M:%S")

#############

##Plot 2
png("plot2.png")
plot(subset$DateTime,subset$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()