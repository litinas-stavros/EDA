data.table <- read.table("household_power_consumption.txt", sep = ";", header= TRUE)
data.table$Date <- as.Date(data.table$Date, format = "%d/%m/%Y")

plot4.table <- subset(data.table, Date >= "2007-02-01" & Date < "2007-02-03")
days <- c("Thu","Fri","Sat")

png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))
plot(as.numeric(levels(plot4.table[,3])[plot4.table[,3]]),xaxt = "n",type="l",xlab= "", ylab="Global Active Power")
axis(1, at = seq(0, 2880, by = 1440), labels = days)


plot(as.numeric(levels(plot4.table[,5])[plot4.table[,5]]),xaxt = "n",type="l",xlab= "datetime", ylab="Voltage")
axis(1, at = seq(0, 2880, by = 1440), labels = days)

x1 <- as.numeric(levels(plot4.table[,7])[plot4.table[,7]])
y1 <- as.numeric(levels(plot4.table[,8])[plot4.table[,8]])
z1 <- plot4.table[,9]

plot(x1, type="l", xaxt = "n", ylab = "Energy sub metering",xlab= "")
lines(y1, col= "red", xaxt = "n")
lines(z1, col = "blue", xaxt = "n")

axis(1, at = seq(0, 2880, by = 1440), labels = days)
legend("topright", legend= c("sub_metering_1","sub_metering_2","sub_metering_3"), bty="n",
       col =c("black", "red", "blue"), lwd=1, merge=FALSE)

plot(as.numeric(levels(plot4.table[,4])[plot4.table[,4]]),xaxt = "n",type="l",xlab= "datetime", ylab="Global_reactive_power")
axis(1, at = seq(0, 2880, by = 1440), labels = days)

dev.off()
