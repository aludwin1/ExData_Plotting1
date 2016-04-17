path <- "~/Desktop/household_power_consumption.txt" 
data <- read.csv(path, header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%m/%d/%Y")
df <- subset(data, (data$Date=="2007-02-01") | (data$Date=="2007-02-02"))
df <- transform(df, newTime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(df$newTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power", ylim = c(0, 6))

plot(df$newTime,df$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(df$newTime,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", ylim = c(0, 30))
lines(df$newTime,df$Sub_metering_2,col="red")
lines(df$newTime,df$Sub_metering_3,col="blue")

legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)

plot(df$newTime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
