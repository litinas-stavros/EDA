data.table <- read.table("household_power_consumption.txt", sep = ";", header= TRUE)
data.table$Date <- as.Date(data.table$Date, format = "%d/%m/%Y")

plot3.table <- subset(data.table, Date >= "2007-02-01" & Date < "2007-02-03")
days <- c("Thu","Fri","Sat")

png(filename="plot3.png", width=480, height=480)

x <- as.numeric(levels(plot3.table[,7])[plot3.table[,7]])
y <- as.numeric(levels(plot3.table[,8])[plot3.table[,8]])
z <- plot3.table[,9]

plot(x, type="l", xaxt = "n", ylab = "Energy sub metering",xlab= "")
lines(y, col= "red", xaxt = "n")
lines(z, col = "blue", xaxt = "n")

axis(1, at = seq(0, 2880, by = 1440), labels = days)
legend("topright", legend= c("sub_metering_1","sub_metering_2","sub_metering_3"), 
       col =c("black", "red", "blue"), lwd=1, merge=FALSE)

dev.off()
