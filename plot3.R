path <- "~/Desktop/household_power_consumption.txt" 
data <- read.csv(path, header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%m/%d/%Y")
df <- subset(data, (data$Date=="2007-02-01") | (data$Date=="2007-02-02"))
df <- transform(df, newTime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

with(df, {
  plot(Sub_metering_1~newTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="", ylim = c(0, 30))
  lines(Sub_metering_2~newTime,col='Red')
  lines(Sub_metering_3~newTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
