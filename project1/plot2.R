data.table <- read.table("household_power_consumption.txt", sep = ";", header= TRUE)
data.table$Date <- as.Date(data.table$Date, format = "%d/%m/%Y")

plot2.table <- subset(data.table, Date >= "2007-02-01" & Date < "2007-02-03")

days <- c("Thu","Fri","Sat")

png(filename="plot2.png", width=480, height=480)

plot(as.numeric(levels(plot2.table[,3])[plot2.table[,3]]),xaxt = "n",type="l",xlab= "", ylab="Global Active Power (kilowatts)")
axis(1, at = seq(0, 2880, by = 1440), labels = days)

dev.off()
