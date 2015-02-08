data.table <- read.table("household_power_consumption.txt", sep = ";", header= TRUE)
data.table$Date <- as.Date(data.table$Date, format = "%d/%m/%Y")

plot1.table <- subset(data.table, Date >= "2007-02-01" & Date < "2007-02-03")

png(filename="plot1.png", width=480, height=480)

hist(as.numeric(levels(plot1.table[,3])[plot1.table[,3]]), col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()